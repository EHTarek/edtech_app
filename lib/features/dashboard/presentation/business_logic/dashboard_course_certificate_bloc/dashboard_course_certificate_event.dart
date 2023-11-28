part of 'dashboard_course_certificate_bloc.dart';

abstract class DashboardCourseCertificateEvent extends Equatable {
  const DashboardCourseCertificateEvent();
}

class DashboardCourseCertificateEventFetchData
    extends DashboardCourseCertificateEvent {
  @override
  List<Object?> get props => [];
}

class DashboardCourseCertificateEventUpdateData
    extends DashboardCourseCertificateEvent {
  final DashboardCourseDetailsEntity courseDetailsEntity;

  const DashboardCourseCertificateEventUpdateData({
    required this.courseDetailsEntity,
  });

  @override
  List<Object?> get props => [courseDetailsEntity];
}
