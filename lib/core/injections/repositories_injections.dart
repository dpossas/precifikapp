import '../../repository/auth_repository.dart';
import '../../repository/create_account_repository.dart';
import '../../repository/recover_password_repository.dart';
import 'injections.dart';

class RepositoriesInjections {
  static void setUp() {
    di.registerFactory<IAuthRepository>(AuthRepository.new);
    di.registerFactory<IRecoverPasswordRepository>(
        RecoverPasswordRepository.new);
    di.registerFactory<ICreateAccountRepository>(CreateAccountRepository.new);
  }
}
