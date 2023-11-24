import 'package:edtech_app/core/network/network_info.dart';
import 'package:edtech_app/data/cached/preferences.dart';
import 'package:edtech_app/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:edtech_app/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:edtech_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_products_category.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_products_category_bloc/dashboard_products_category_bloc.dart';
import 'package:edtech_app/log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

init() async {
  ///! Features - Dashboard
  //Bloc
  sl.registerFactory<DashboardProductsCategoryBloc>(
    () => DashboardProductsCategoryBloc(
      getDashboardProductsCategory: sl(),
    ),
  );
  // Use Cases
  sl.registerLazySingleton(
    () => GetDashboardProductsCategory(
      dashboardRepository: sl(),
    ),
  );

  //Repository
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Data Source
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  ///! Core
  sl
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        connectionChecker: sl(),
      ),
    )
    ..registerLazySingleton<Preferences>(
      () => PreferencesImpl(
        prefs: sl(),
        secureStorage: sl(),
      ),
    )
    ..registerLazySingleton<Log>(() => LogImpl());

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => sharedPreferences)
    ..registerLazySingleton(() => InternetConnectionChecker())
    ..registerLazySingleton(() => Client())
    ..registerLazySingleton(() => const FlutterSecureStorage());
}
