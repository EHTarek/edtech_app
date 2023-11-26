import 'package:edtech_app/features/dashboard/domain/entities/dashboard_enrolled_courses_entity.dart';

class DashboardEnrolledCoursesModel extends DashboardEnrolledCoursesEntity {
  const DashboardEnrolledCoursesModel({
    required super.id,
    required super.title,
    required super.numberOfModules,
    required super.image,
    required super.instructor,
    required super.completedModules,
  });

  factory DashboardEnrolledCoursesModel.fromJson(Map<String, dynamic> json) =>
      DashboardEnrolledCoursesModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        numberOfModules: json['numberOfModules'] ?? 0,
        image: json['image'] ?? '',
        instructor: json['instructor'] ?? '',
        completedModules: json['completedModules'] ?? 0,
      );
}
