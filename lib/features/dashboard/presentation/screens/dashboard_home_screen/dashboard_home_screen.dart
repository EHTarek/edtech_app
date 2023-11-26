import 'package:edtech_app/constants/navigation/routes.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_enrolled_courses_entity.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_enrolled_courses_bloc/dashboard_enrolled_courses_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/views/dashboard_title_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DashboardTitleView(title: 'Dashboard'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            BlocBuilder<DashboardEnrolledCoursesBloc,
                DashboardEnrolledCoursesState>(
              builder: (context, enrolledCourseState) {
                if (enrolledCourseState is DashboardEnrolledCoursesLoaded) {
                  return SliverList.separated(
                    itemCount: enrolledCourseState.enrolledCoursesEntity.length,
                    itemBuilder: (context, index) => EnrolledCourseCardView(
                      enrolledCoursesEntity:
                          enrolledCourseState.enrolledCoursesEntity[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                  );
                }
                return SliverToBoxAdapter(
                  child: Text(
                    'No course found',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EnrolledCourseCardView extends StatelessWidget {
  const EnrolledCourseCardView({
    super.key,
    required this.enrolledCoursesEntity,
  });

  final DashboardEnrolledCoursesEntity enrolledCoursesEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      enrolledCoursesEntity.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        enrolledCoursesEntity.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.person_pin_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            enrolledCoursesEntity.instructor,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Course Progress',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: enrolledCoursesEntity.completedModules /
                        enrolledCoursesEntity.numberOfModules,
                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            Text(
              'Modules Completed ${enrolledCoursesEntity.completedModules} of ${enrolledCoursesEntity.numberOfModules}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, Routes.kDashboardCoursePlayerScreen);
                },
                style: OutlinedButton.styleFrom(
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                child: const Text('Continue Course'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
