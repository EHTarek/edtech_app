part of 'dashboard_course_details_bloc.dart';

abstract class DashboardCourseDetailsState extends Equatable {
  const DashboardCourseDetailsState();
}

class DashboardCourseDetailsInitial extends DashboardCourseDetailsState {
  @override
  List<Object> get props => [];
}

class DashboardCourseDetailsLoaded extends DashboardCourseDetailsState {
  final List<DashboardCourseDetailsEntity> courseDetailsEntity;

  const DashboardCourseDetailsLoaded({required this.courseDetailsEntity});

  @override
  List<Object> get props => [];
}

class DashboardCourseDetailsError extends DashboardCourseDetailsState {
  final String message;

  const DashboardCourseDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}

class DashboardCourseDetailsNoInternet extends DashboardCourseDetailsState {
  @override
  List<Object> get props => [];
}

class DashboardCourseDetailsSessionOut extends DashboardCourseDetailsState {
  @override
  List<Object> get props => [];
}
