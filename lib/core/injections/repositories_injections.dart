import 'package:precificapp/repository/create_account_repository.dart';

import '../../repository/auth_repository.dart';
import '../../repository/recover_password_repository.dart';
import 'injections.dart';

class RepositoriesInjections {
  static void setUp() {
    di.registerFactory<IAuthRepository>(() => AuthRepository());
    di.registerFactory<IRecoverPasswordRepository>(
        () => RecoverPasswordRepository());
    di.registerFactory<ICreateAccountRepository>(
        () => CreateAccountRepository());
  }
}
