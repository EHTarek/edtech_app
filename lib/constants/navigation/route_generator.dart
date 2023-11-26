import 'package:edtech_app/constants/navigation/routes.dart';
import 'package:edtech_app/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:edtech_app/features/auth/presentation/screens/auth_signup_screen.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/dashboard_course_player_screen/dashboared_course_player_screen.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:edtech_app/injection_container.dart';
import 'package:edtech_app/log.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Log log = sl<Log>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    log.verbose(
      title: 'Value Passed in Navigating Screen --> ',
      msg: args.runtimeType,
    );
    // if (kDebugMode) {
    //   print(args.toString());
    // }
    switch (settings.name) {
      case Routes.kRoot:
        return MaterialPageRoute(builder: (_) => const AuthLoginScreen());
      case Routes.kAuthSignupScreen:
        return MaterialPageRoute(builder: (_) => const AuthSignupScreen());
      case Routes.kDashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.kDashboardCoursePlayerScreen:
        return MaterialPageRoute(
            builder: (_) => const DashboardCoursePlayerScreen());

      //Error pages
      default:
        return MaterialPageRoute(builder: (_) => const NavigationErrorScreen());
    }
  }
}

class NavigationErrorScreen extends StatelessWidget {
  const NavigationErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: Text(
          'Navigation Error\nGo Back and Try Again.',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
