part of 'dashboard_course_details_bloc.dart';

abstract class DashboardCourseDetailsEvent extends Equatable {
  const DashboardCourseDetailsEvent();
}

class DashboardCourseDetailsEventFetchData
    extends DashboardCourseDetailsEvent {
  @override
  List<Object?> get props => [];
}