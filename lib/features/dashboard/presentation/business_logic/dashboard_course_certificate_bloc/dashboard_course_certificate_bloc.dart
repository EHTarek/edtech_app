import 'package:edtech_app/data/db/local_db.dart';
import 'package:edtech_app/data/db/model/course_complete_model.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_course_details_entity.dart';
import 'package:edtech_app/injection_container.dart';
import 'package:edtech_app/log.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_course_certificate_event.dart';

part 'dashboard_course_certificate_state.dart';

class DashboardCourseCertificateBloc extends Bloc<
    DashboardCourseCertificateEvent, DashboardCourseCertificateState> {
  DashboardCourseCertificateBloc()
      : super(DashboardCourseCertificateInitial()) {
    on<DashboardCourseCertificateEventFetchData>(
        _onDashboardCourseCertificateEventFetchData);
    on<DashboardCourseCertificateEventUpdateData>(
        _onDashboardCourseCertificateEventUpdateData);
  }

  Log log = sl<Log>();

  int courseCompleteCounter = 0;

  _onDashboardCourseCertificateEventFetchData(
    DashboardCourseCertificateEventFetchData event,
    Emitter<DashboardCourseCertificateState> emit,
  ) async {
    emit(DashboardCourseCertificateInitial());
    try {
      final db = LocalDbImpl.instance;
      List<CourseCompleteModel> allCompletedCourse =
          await db.readAllCourseComplete();
      emit(
        DashboardCourseCertificateLoaded(
          allCompletedCourse: allCompletedCourse,
        ),
      );
    } catch (e) {
      emit(DashboardCourseCertificateError(message: e.toString()));
    }
  }

  _onDashboardCourseCertificateEventUpdateData(
    DashboardCourseCertificateEventUpdateData event,
    Emitter<DashboardCourseCertificateState> emit,
  ) async {
    emit(DashboardCourseCertificateInitial());
    bool found = false;
    try {
      final db = LocalDbImpl.instance;
      CourseCompleteModel module = CourseCompleteModel(
        id: 0,
        courseTitle: '',
        courseId: '',
      );
      List<CourseCompleteModel> allCompletedCourse =
          await db.readAllCourseComplete();
      for (int i = 0; i < allCompletedCourse.length; i++) {
        if (allCompletedCourse[i].courseTitle ==
            event.courseDetailsEntity.module) {
          found = true;
          module = CourseCompleteModel(
            id: allCompletedCourse[i].id,
            courseTitle: allCompletedCourse[i].courseTitle,
            courseId: allCompletedCourse[i].courseId,
          );
          return;
        }
      }
      if (found) {
        await db.deleteCourseComplete(module);
      } else {
        await db.createCourseComplete(module);
      }
      List<CourseCompleteModel> completedCourse =
          await db.readAllCourseComplete();
      log.debug(
          title: 'Course Certificate Bloc',
          msg:
              'Completed: $found \n Number of Completed Course: ${completedCourse.length}');
      emit(
        DashboardCourseCertificateUpdated(
          completed: found,
          numberOfCompletedCourse: completedCourse.length,
        ),
      );
    } catch (e) {
      emit(DashboardCourseCertificateError(message: e.toString()));
    }
  }
}
