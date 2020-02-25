// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:demo_app/data/heroku_book/datasource/heroku_remote_datasource.dart';
import 'package:demo_app/core/network/heroku_client.dart';
import 'package:demo_app/data/heroku_book/repository/repository.dart';
import 'package:demo_app/domain/home/use_case/get_all_book_use_case.dart';
import 'package:demo_app/domain/repository/domain_repo.dart';
import 'package:demo_app/presentation/home/bloc/home_bloc.dart';
import 'package:demo_app/data/heroku_book/datasource/angram_remote_ds.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<HerokuBookRemoteDs>(() => HerokuBookRemoteDsImpl())
    ..registerLazySingleton<HerokuBookRemoteDsImpl>(
        () => HerokuBookRemoteDsImpl())
    ..registerFactory<HerokuClient>(() => HerokuClientImpl())
    ..registerLazySingleton<HerokuClientImpl>(() => HerokuClientImpl())
    ..registerLazySingleton<HerokuRepositoryImpl>(() => HerokuRepositoryImpl())
    ..registerLazySingleton<GetAllBookUseCase>(
        () => GetAllBookUseCase(herokuRepository: getIt<HerokuRepository>()))
    ..registerLazySingleton<GetListAnagramUseCase>(() =>
        GetListAnagramUseCase(herokuRepository: getIt<HerokuRepository>()))
    ..registerLazySingleton<IsAnagramUseCase>(
        () => IsAnagramUseCase(herokuRepository: getIt<HerokuRepository>()))
    ..registerLazySingleton<IsIsogramUseCase>(
        () => IsIsogramUseCase(herokuRepository: getIt<HerokuRepository>()))
    ..registerFactory<HerokuRepository>(() => HerokuRepositoryImpl())
    ..registerFactory<HomeBloc>(() => HomeBloc())
    ..registerFactory<AnagramDs>(() => AnagramDsImpl())
    ..registerLazySingleton<AnagramDsImpl>(() => AnagramDsImpl());
}
