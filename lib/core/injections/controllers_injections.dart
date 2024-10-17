import '../../controller/auth_controller.dart';
import '../../controller/recover_password_controller.dart';
import 'injections.dart';

class ControllersInjections {
  static setUp() {
    di.registerLazySingleton<IAuthController>(() => AuthController(di.get()));
    di.registerLazySingleton<IRecoverPasswordController>(
        () => RecoverPasswordController(di.get()));
  }
}
