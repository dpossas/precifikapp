import 'package:get_it/get_it.dart';

import '../../services/secure_storage_service.dart';
import '../http/dio_client.dart';
import 'controllers_injections.dart';
import 'repositories_injections.dart';

final di = GetIt.instance;

class Injections {
  static Future<void> setUp() async {
    di.registerLazySingleton<ISecureStorageService>(SecureStorageService.new);

    final dioClient = await DioClient.createDio(di.get());
    di.registerSingleton<IDioClient>(dioClient);

    RepositoriesInjections.setUp();
    ControllersInjections.setUp();
  }
}
