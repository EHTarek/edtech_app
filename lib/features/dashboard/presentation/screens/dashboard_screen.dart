import 'package:edtech_app/features/dashboard/presentation/screens/dashboard_bookmarks_screen/dashboard_bookmarks_screen.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/dashboard_courses_screen/dashboard_courses_screen.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/dashboard_home_screen/dashboard_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int navIndex = 0;
  List<Widget> navItemView = [
    const DashboardHomeScreen(),
    const DashboardCoursesScreen(),
    const DashboardBookmarksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: navItemView[navIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (value) {
          navIndex = value;
          setState(() {});
        },
        showUnselectedLabels: true,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
        ],
      ),
    );
  }
}
