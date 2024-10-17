import 'package:dio/dio.dart';

import '../core/exceptions/user_not_found_exception.dart';
import '../models/user.dart';
import 'base_repository.dart';

abstract class IAuthRepository {
  Future<User?> doLogin(String username, String password);
}

class AuthRepository extends BaseRepository implements IAuthRepository {
  @override
  Future<User?> doLogin(String username, String password) async {
    final response = await dio.post(
      'API/Login',
      data: FormData.fromMap({
        'email': username,
        'password': password,
        'rememberMe': 1,
      }),
    );

    if (response.data == null) {
      throw UserNotFound(
        title: 'Dados incorretos',
        message: 'O e-mail e/ou a senha estão incorretos. Tente novamente',
      );
    }

    return User.fromJson(response.data);
  }
}
