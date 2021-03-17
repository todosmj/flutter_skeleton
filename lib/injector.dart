import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:skeleton/services/product_service.dart';
import 'package:skeleton/services/user_service.dart';
import 'package:skeleton/view_models/product_view_model.dart';
import 'package:skeleton/view_models/user_view_model.dart';

import 'constants/context.dart';
import 'enums/env_status.dart';

// ignore: non_constant_identifier_names
final GetIt Injector = GetIt.instance;


Future<void> setUpInjector({ bool debugMode = false }) async {
  /// [SERVER SETUP]
  // 서버 설정을 해주세요.
  Injector.registerLazySingleton<Context>(() => Context());
  await setEnv();


  /// [MODULES]

  /// [SERVICES]
  //registerLazySingleton<T>(FactoryFunc<T> func)
  Injector.registerLazySingleton<UserService>(() => UserService());
  Injector.registerLazySingleton<ProductService>(() => ProductService());

  /// [VIEW MODELS]
  //registerFactory<T>(FactoryFunc<T> func)
  Injector.registerFactory<UserViewModel>(() => UserViewModel());
  Injector.registerFactory<ProductViewModel>(() => ProductViewModel());
  //새 인스턴스를 사용하지 않는 생성자를 구현할때는 factory 사용

}

Future setEnv() async{
  Context _context = Injector<Context>();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String packageName = packageInfo.packageName;

  switch(packageName) {
    case 'com.example.skeleton' :
      _context.setBuildType(BuildType.dev);
      break;
    case 'com.baza.app.staging' :
      _context.setBuildType(BuildType.staging);
      break;
    default:
      _context.setBuildType(BuildType.prod);
  }

  _context.setAppVersion(appVersion: packageInfo.version, buildNumber: packageInfo.buildNumber, packageName: packageName);
}