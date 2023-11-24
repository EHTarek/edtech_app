part of 'dashboard_enrolled_courses_bloc.dart';

abstract class DashboardEnrolledCoursesEvent extends Equatable {
  const DashboardEnrolledCoursesEvent();
}

class DashboardEnrolledCoursesEventFetchData
    extends DashboardEnrolledCoursesEvent {
  @override
  List<Object?> get props => [];
}
