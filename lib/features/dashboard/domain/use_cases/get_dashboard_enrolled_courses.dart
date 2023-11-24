import 'package:edtech_app/core/error/failure.dart';
import 'package:edtech_app/core/params/empty_param.dart';
import 'package:edtech_app/core/use_case/use_case.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_enrolled_courses_entity.dart';
import 'package:edtech_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class GetDashboardEnrolledCourses
    extends UseCase<DashboardEnrolledCoursesEntity, EmptyParam> {
  final DashboardRepository dashboardRepository;

  GetDashboardEnrolledCourses({required this.dashboardRepository});

  @override
  Future<Either<Failure, DashboardEnrolledCoursesEntity>> call(
      {required EmptyParam params}) {
    return dashboardRepository.getDashboardEnrolledCourses();
  }
}
