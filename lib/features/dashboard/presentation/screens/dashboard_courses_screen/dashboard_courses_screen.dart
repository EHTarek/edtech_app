import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DashboardCoursesScreen extends StatelessWidget {
  const DashboardCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.dashboard,
            size: 24,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 56,
        backgroundColor: Theme.of(context).colorScheme.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 24,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [

        ],
      ),
    );
  }
}
