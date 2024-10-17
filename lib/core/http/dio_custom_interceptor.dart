import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../services/navigator_service.dart';
import '../routes/auth/routes.dart';

typedef AccessToken = Future<String?> Function();
typedef DeviceModel = Future<String> Function();
typedef VersionApp = Future<String?> Function();
typedef UserId = Future<int?> Function();
typedef DeviceId = Future<String> Function();

class Failure {
  final String message;

  Failure(this.message);
}

class CustomInterceptors extends Interceptor {
  final Dio dio;
  final AccessToken accessToken;
  final DeviceModel deviceModel;
  final VersionApp versionApp;

  final UserId clientId;
  final DeviceId deviceId;

  // final _lock = b.Lock();

  int lastRefreshToken = -1;

  CustomInterceptors(
    this.dio, {
    required this.accessToken,
    required this.deviceModel,
    required this.versionApp,
    required this.clientId,
    required this.deviceId,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.uri.toString().contains(options.baseUrl)) {
      final token = await accessToken();
      final deviceModel = await this.deviceModel();
      final versionApp = await this.versionApp();
      final clientId = await this.clientId();
      final deviceId = await this.deviceId();
      final deviceGMT = DateTime.now().timeZoneOffset.inHours;

      dio.options.headers.addAll({
        'device-model': deviceModel,
        'version-app': versionApp,
        'userSystemId': clientId,
        'deviceId': deviceId,
        'deviceGMT': deviceGMT,
        '__timestamp': DateTime.now(),
      });
      if (token != null && token.isEmpty) {
        if (options.headers.containsKey(HttpHeaders.authorizationHeader)) {
          options.headers.remove(HttpHeaders.authorizationHeader);
        }
      } else {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.response?.requestOptions;
    if (requestOptions != null && err.response?.statusCode == 401) {
      await Navigator.pushNamedAndRemoveUntil(
        NavigatorService.context,
        AuthRoutes.auth,
        (route) => true,
      );
      return;
    }

    try {
      super.onError(err, handler);
    } on Exception catch (_) {}
  }
}
