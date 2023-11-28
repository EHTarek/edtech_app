import 'package:edtech_app/core/network/network_info.dart';
import 'package:edtech_app/data/cached/preferences.dart';
import 'package:edtech_app/features/auth/presentation/business_logic/user_auth_bloc/user_auth_bloc.dart';
import 'package:edtech_app/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:edtech_app/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:edtech_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_course_details.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_enrolled_courses.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_course_certificate_bloc/dashboard_course_certificate_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_course_details_bloc/dashboard_course_details_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_enrolled_courses_bloc/dashboard_enrolled_courses_bloc.dart';
import 'package:edtech_app/log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

init() async {
  ///! Features - User Authentication
//Bloc
  sl.registerFactory<UserAuthBloc>(
    () => UserAuthBloc(
      log: sl<Log>(),
    ),
  );

  ///! Features - Dashboard
  //Bloc
  sl
    ..registerFactory<DashboardEnrolledCoursesBloc>(
      () => DashboardEnrolledCoursesBloc(
        getDashboardProductsCategory: sl(),
      ),
    )
    ..registerFactory<DashboardCourseDetailsBloc>(
      () => DashboardCourseDetailsBloc(
        getDashboardCourseDetails: sl(),
      ),
    )
    ..registerFactory<DashboardCourseCertificateBloc>(
      () => DashboardCourseCertificateBloc(),
    );
  // Use Cases
  sl
    ..registerLazySingleton(
      () => GetDashboardEnrolledCourses(
        dashboardRepository: sl(),
      ),
    )
    ..registerLazySingleton(
      () => GetDashboardCourseDetails(
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
