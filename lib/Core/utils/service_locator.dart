import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Home/Data/data_sources/home_local_data_source.dart';
import '../../Features/Home/Data/data_sources/home_remote_data_source.dart';
import '../../Features/Home/Data/repo/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());

  getIt.registerSingleton<HomeRemoteDataSourceImpl>(HomeRemoteDataSourceImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>(),
    homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>(),
  ));
}
