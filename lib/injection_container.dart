import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qube_cashier/core/Network/connection_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
final serviceLocator = sl;

BaseOptions _dioOptions() {
  return BaseOptions(
    baseUrl: 'http://209.250.237.58:5031/api', // Base URL
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
    sendTimeout: const Duration(seconds: 50),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    validateStatus: (status) {
      return status != null && status <= 500;
    },
  );
}

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<ConnectionCubit>(() => ConnectionCubit());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));

  if (!serviceLocator.isRegistered<Dio>()) {
    serviceLocator.registerLazySingleton<Dio>(() => Dio(_dioOptions()));
  }

  //! ############################### Service ###############################
  // serviceLocator.registerLazySingleton<FailureHandler>(() => FailureHandler());
  // serviceLocator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  //! ################################ Datasources #################################

  //! ################################# Repository #################################

  //! ################################# Usecases #################################

  //! ############################### Bloc Or Cubit ###############################
}
