import 'package:edtech_app/core/error/failure.dart';
import 'package:edtech_app/core/params/empty_param.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_enrolled_courses_entity.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_enrolled_courses.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_enrolled_courses_event.dart';
part 'dashboard_enrolled_courses_state.dart';

class DashboardProductsCategoryBloc extends Bloc<DashboardEnrolledCoursesEvent,
    DashboardEnrolledCoursesState> {
  DashboardProductsCategoryBloc({required this.getDashboardProductsCategory})
      : super(DashboardEnrolledCoursesInitial()) {
    on<DashboardEnrolledCoursesEventFetchData>(
        _onDashboardProductsCategoryEventFetchData);
  }

  final GetDashboardEnrolledCourses getDashboardProductsCategory;

  _onDashboardProductsCategoryEventFetchData(
      DashboardEnrolledCoursesEventFetchData event,
      Emitter<DashboardEnrolledCoursesState> emit) async {
    emit(DashboardEnrolledCoursesInitial());
    final result = await getDashboardProductsCategory(params: EmptyParam());
    result.fold(
      (l) {
        switch (l.runtimeType) {
          case const (ConnectionFailure):
            return emit(DashboardEnrolledCoursesNoInternet());
          case const (TokenInvalid):
            return emit(DashboardEnrolledCoursesSessionOut());
          default:
            return emit(DashboardEnrolledCoursesError(message: l.message));
        }
      },
      (r) => emit(DashboardEnrolledCoursesLoaded(enrolledCoursesEntity: r)),
    );
  }
}
