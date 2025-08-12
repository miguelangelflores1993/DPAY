import 'package:get_it/get_it.dart';

import 'package:networking_flutter_dio/core/networking/api_service.dart';

import 'data/datasources/{{feature_name.snakeCase()}}_data_source.dart';
import 'data/datasources/{{feature_name.snakeCase()}}_data_source_impl.dart';
import 'package:app/modules/{{feature_name.snakeCase()}}/presentation/bloc/{{feature_name.snakeCase()}}_bloc.dart';


// Repository
import 'data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import 'domain/repository/{{feature_name.snakeCase()}}_repository.dart';

import 'domain/usecases/get_all_{{feature_name.snakeCase()}}_use_case.dart';
import 'domain/usecases/get_{{feature_name.snakeCase()}}_by_id_use_case.dart';
import 'domain/usecases/create_{{feature_name.snakeCase()}}_use_case.dart';



void init{{feature_name.pascalCase()}}Injection(GetIt sl) {
  sl.registerFactory(() => {{feature_name.pascalCase()}}Bloc(
    getAll{{feature_name.pascalCase()}}UseCase: sl(),
    get{{feature_name.pascalCase()}}UseCase: sl(),
    create{{feature_name.pascalCase()}}UseCase: sl(),
  ));

  // Use Cases
  sl
    ..registerLazySingleton(() => GetAll{{feature_name.pascalCase()}}UseCase(sl()))
    ..registerLazySingleton(() => Get{{feature_name.pascalCase()}}UseCase(sl()))
    ..registerLazySingleton(() => Create{{feature_name.pascalCase()}}UseCase(sl()));

  // Repository
  sl.registerLazySingleton<{{feature_name.pascalCase()}}Repository>(
    () => {{feature_name.pascalCase()}}RepositoryImpl(
      {{feature_name.camelCase()}}DataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<{{feature_name.pascalCase()}}RemoteDataSource>(
    () => {{feature_name.pascalCase()}}DataSourceImpl(
      api: sl<ApiService>(instanceName: '{{service_name}}'),
    ),
  );


} 