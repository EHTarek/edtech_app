import 'package:dartz/dartz.dart';
import 'package:edtech_app/core/error/failure.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_enrolled_courses_entity.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<DashboardEnrolledCoursesEntity>>>
      getDashboardEnrolledCourses();
}
