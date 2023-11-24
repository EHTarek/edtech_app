part of 'dashboard_enrolled_courses_bloc.dart';

abstract class DashboardEnrolledCoursesState extends Equatable {
  const DashboardEnrolledCoursesState();
}

class DashboardEnrolledCoursesInitial extends DashboardEnrolledCoursesState {
  @override
  List<Object> get props => [];
}

class DashboardEnrolledCoursesLoaded extends DashboardEnrolledCoursesState {
  final DashboardEnrolledCoursesEntity enrolledCoursesEntity;

  const DashboardEnrolledCoursesLoaded({required this.enrolledCoursesEntity});

  @override
  List<Object> get props => [];
}

class DashboardEnrolledCoursesError extends DashboardEnrolledCoursesState {
  final String message;

  const DashboardEnrolledCoursesError({required this.message});

  @override
  List<Object> get props => [message];
}

class DashboardEnrolledCoursesNoInternet
    extends DashboardEnrolledCoursesState {
  @override
  List<Object> get props => [];
}

class DashboardEnrolledCoursesSessionOut
    extends DashboardEnrolledCoursesState {
  @override
  List<Object> get props => [];
}
