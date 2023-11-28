import 'package:bloc/bloc.dart';
import 'package:edtech_app/core/error/failure.dart';
import 'package:edtech_app/core/params/empty_param.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_course_details_entity.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_course_details.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_course_details_event.dart';

part 'dashboard_course_details_state.dart';

class DashboardCourseDetailsBloc
    extends Bloc<DashboardCourseDetailsEvent, DashboardCourseDetailsState> {
  DashboardCourseDetailsBloc({
    required this.getDashboardCourseDetails,
  }) : super(DashboardCourseDetailsInitial()) {
    on<DashboardCourseDetailsEventFetchData>(
        _onDashboardCourseDetailsEventFetchData);
  }

  final GetDashboardCourseDetails getDashboardCourseDetails;

  _onDashboardCourseDetailsEventFetchData(
    DashboardCourseDetailsEventFetchData event,
    Emitter<DashboardCourseDetailsState> emit,
  ) async {
    emit(DashboardCourseDetailsInitial());
    final result = await getDashboardCourseDetails(params: EmptyParam());
    result.fold(
      (l) {
        switch (l.runtimeType) {
          case const (ConnectionFailure):
            return emit(DashboardCourseDetailsNoInternet());
          case const (TokenInvalid):
            return emit(DashboardCourseDetailsSessionOut());
          default:
            return emit(DashboardCourseDetailsError(message: l.message));
        }
      },
      (r) => emit(DashboardCourseDetailsLoaded(courseDetailsEntity: r)),
    );
  }
}
