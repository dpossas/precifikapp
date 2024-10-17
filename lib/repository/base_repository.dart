import 'package:dio/dio.dart';

import '../core/http/dio_client.dart';
import '../core/injections/injections.dart';

class BaseRepository {
  late IDioClient dio;
  late CancelToken cancelToken;

  BaseRepository() {
    dio = di.get<IDioClient>();
    cancelToken = CancelToken();
  }
}
