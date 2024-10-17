import 'package:dio/dio.dart';

import 'base_repository.dart';

abstract class IRecoverPasswordRepository {
  Future<void> sendEmail(String email);
}

class RecoverPasswordRepository extends BaseRepository
    implements IRecoverPasswordRepository {
  @override
  Future<void> sendEmail(String email) async {
    await dio.post(
      'API/Login',
      data: FormData.fromMap({
        'action': 'recover',
        'email': email,
      }),
    );
  }
}
