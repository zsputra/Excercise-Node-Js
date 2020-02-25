import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
// import 'getit_configuration.iconfig.dart' as injector_config;
import 'package:shared_preferences/shared_preferences.dart';

import 'getit_configuration.iconfig.dart';

final getIt = GetIt.instance;
Future<void> setupInjections() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  // getIt.registerLazySingleton(() => BaseClient());
  configure();
}

@injectableInit
void configure() => $initGetIt();
