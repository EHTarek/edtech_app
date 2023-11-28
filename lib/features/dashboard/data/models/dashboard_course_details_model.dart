import 'package:edtech_app/features/dashboard/domain/entities/dashboard_course_details_entity.dart';

class DashboardCourseDetailsModel extends DashboardCourseDetailsEntity {
  const DashboardCourseDetailsModel({
    required super.module,
    required super.content,
  });

  factory DashboardCourseDetailsModel.fromJson(Map<String, dynamic> json) =>
      DashboardCourseDetailsModel(
        module: json["module"] ?? '',
        content: json["content"] == null
            ? []
            : List<String>.from(json["content"].map((x) => x)),
      );
}
