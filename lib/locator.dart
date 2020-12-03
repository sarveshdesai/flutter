import 'package:rescue/global/repository/auth_repo.dart';
import 'package:rescue/global/repository/storage_repo.dart';
import 'package:rescue/global/controllers/user_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}
