import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklyapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ApiService>(ApiService(Dio()));
  locator.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDataSource: HomeRemoteDataSourceImp(
        locator.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImp(),
    ),
  );
}
