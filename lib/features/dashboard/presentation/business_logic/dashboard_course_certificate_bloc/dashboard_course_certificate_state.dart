part of 'dashboard_course_certificate_bloc.dart';

abstract class DashboardCourseCertificateState extends Equatable {
  const DashboardCourseCertificateState();
}

class DashboardCourseCertificateInitial
    extends DashboardCourseCertificateState {
  @override
  List<Object> get props => [];
}

class DashboardCourseCertificateLoaded extends DashboardCourseCertificateState {
  final List<CourseCompleteModel> allCompletedCourse;

  const DashboardCourseCertificateLoaded({required this.allCompletedCourse});
  @override
  List<Object> get props => [allCompletedCourse];
}

class DashboardCourseCertificateUpdated
    extends DashboardCourseCertificateState {
  final bool completed;
final int numberOfCompletedCourse;
  const DashboardCourseCertificateUpdated({required this.completed,required this.numberOfCompletedCourse,});
  @override
  List<Object> get props => [completed,numberOfCompletedCourse];
}

class DashboardCourseCertificateError extends DashboardCourseCertificateState {
  final String message;

  const DashboardCourseCertificateError({required this.message});

  @override
  List<Object> get props => [message];
}
