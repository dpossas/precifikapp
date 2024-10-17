import 'dart:developer';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../flavors.dart';
import '../../services/secure_storage_service.dart';
import 'dio_custom_interceptor.dart';

abstract class IDioClient {
  late Dio dio;
  Future<dynamic> interceptRequests(String path, Future<Response> request);
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  });
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
  });
  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  });

  late CookieManager cookieManager;
}

class DioClient implements IDioClient {
  @override
  Dio dio;
  @override
  CookieManager cookieManager;

  DioClient(this.dio, this.cookieManager);

  // New DioClient
  static Future<IDioClient> createDio(ISecureStorageService storage) async {
    final baseOptions = BaseOptions(
      baseUrl: F.baseUrl,
      headers: {
        'User-Agent': 'precifikapp/${F.appVersion}',
      },
      persistentConnection: false,
      followRedirects: false,
      receiveTimeout: const Duration(minutes: 10),
      validateStatus: (statusCode) {
        return statusCode == 401 ? false : true;
      },
    );

    final dio = Dio(baseOptions);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;

    final cookieJar = PersistCookieJar(
      storage: FileStorage('$appDocPath/.cookies/'),
    );
    @override
    CookieManager cookieManager = CookieManager(cookieJar);

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
      CustomInterceptors(
        dio,
        accessToken: () async {
          return 'access-token';
        },
        clientId: () async {
          final user = await storage.getLoggedUser();
          return user?.customerId;
        },
        deviceModel: () async {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          if (Platform.isAndroid) {
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            return androidInfo.model;
          }

          if (Platform.isIOS) {
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
            return iosInfo.utsname.machine;
          }

          return 'unknown device model';
        },
        versionApp: () async {
          return F.appVersion;
        },
        deviceId: () async {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          if (Platform.isAndroid) {
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            return androidInfo.id;
          }

          if (Platform.isIOS) {
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
            return iosInfo.identifierForVendor ?? '[iOS] unknown device id';
          }

          return 'unknown device id';
        },
      ),
      cookieManager,
    ]);

    return DioClient(dio, cookieManager);
  }

  Future<dynamic> _exceptionHandler(Exception e) async {
    try {
      switch (e.runtimeType) {
        case DioException _:
          final error = (e as DioException);
          log(error.toString());
          break;
        default:
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> interceptRequests(
      String path, Future<Response> request) async {
    try {
      var response = await request;

      return response;
    } on Exception catch (e) {
      return _exceptionHandler(e);
    }
  }

  void resetContentType() {
    dio.options.headers['content-type'] = 'application/json; charset=utf-8';
    dio.options.headers['User-Agent'] = 'precifikapp/${F.appVersion}';
  }

  @override
  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    resetContentType();

    return await dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      data: data,
      options: options,
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    resetContentType();
    return await interceptRequests(
      path,
      dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await interceptRequests(
      path,
      dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    resetContentType();
    return await interceptRequests(
      path,
      dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    resetContentType();
    return await interceptRequests(
      path,
      dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    resetContentType();
    return await interceptRequests(
      path,
      dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }
}
