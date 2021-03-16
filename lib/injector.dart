import 'package:get_it/get_it.dart';
import 'package:skeleton/services/user_service.dart';
import 'package:skeleton/view_models/user_view_model.dart';

// ignore: non_constant_identifier_names
final GetIt Injector = GetIt.instance;

Future<void> setUpInjector({ bool debugMode = false }) async {
  /// [SERVER SETUP]
  // 서버 설정을 해주세요.

  /// [MODULES]

  /// [SERVICES]
  Injector.registerLazySingleton<UserService>(() => UserService());

  /// [VIEW MODELS]
  Injector.registerFactory<UserViewModel>(() => UserViewModel());
}