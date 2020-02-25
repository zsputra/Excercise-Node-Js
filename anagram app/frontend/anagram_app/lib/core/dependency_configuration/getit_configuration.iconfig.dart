// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:demo_app/core/network/network_client.dart';
import 'package:http/src/client.dart';
import 'package:demo_app/data/anagram_backend/datasource/angram_remote_ds.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<BackendClient>(() => BackendClientImpl(getIt<Client>()))
    ..registerLazySingleton<BackendClientImpl>(
        () => BackendClientImpl(getIt<Client>()))
    ..registerFactory<AnagramDs>(() => AnagramDsImpl())
    ..registerLazySingleton<AnagramDsImpl>(() => AnagramDsImpl());
}
