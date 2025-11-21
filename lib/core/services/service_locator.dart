import 'package:daily_cash/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:daily_cash/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt<ApiService>()));
  // getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt<ApiService>()));
}
