import 'dart:io';

import 'package:edtech_app/app_config.dart';
import 'package:edtech_app/constants/app_observer.dart';
import 'package:edtech_app/constants/navigation/route_generator.dart';
import 'package:edtech_app/constants/navigation/routes.dart';
import 'package:edtech_app/constants/theme/app_theme.dart';
import 'package:edtech_app/features/auth/presentation/business_logic/user_auth_bloc/user_auth_bloc.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_course_details.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_enrolled_courses.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_course_certificate_bloc/dashboard_course_certificate_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_course_details_bloc/dashboard_course_details_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_enrolled_courses_bloc/dashboard_enrolled_courses_bloc.dart';
import 'package:edtech_app/firebase_options.dart';
import 'package:edtech_app/injection_container.dart';
import 'package:edtech_app/log.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    // [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );

  if (Platform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppObserver();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserAuthBloc(
            log: sl<Log>(),
          ),
        ),
        BlocProvider(
          create: (context) => DashboardEnrolledCoursesBloc(
            getDashboardProductsCategory: sl<GetDashboardEnrolledCourses>(),
          ),
        ),
        BlocProvider(
          create: (context) => DashboardCourseDetailsBloc(
            getDashboardCourseDetails: sl<GetDashboardCourseDetails>(),
          ),
        ),
        BlocProvider(
          create: (context) => DashboardCourseCertificateBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: AppTheme.lightColorScheme,
          fontFamily: 'Poppins',
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: AppTheme.darkColorScheme,
          fontFamily: 'Poppins',
        ),
        themeMode: ThemeMode.light,

        /// Navigation
        initialRoute: Routes.kRoot,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
