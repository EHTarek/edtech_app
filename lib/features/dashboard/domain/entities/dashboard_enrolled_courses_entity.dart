import 'package:equatable/equatable.dart';

class DashboardEnrolledCoursesEntity extends Equatable {
  final String id;
  final String title;
  final String instructor;
  final int numberOfModules;
  final int completedModules;
  final String image;

  const DashboardEnrolledCoursesEntity({
    required this.id,
    required this.title,
    required this.instructor,
    required this.numberOfModules,
    required this.completedModules,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "instructor": instructor,
        "numberOfModules": numberOfModules,
        "completedModules": completedModules,
        "image": image,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        instructor,
        numberOfModules,
        completedModules,
        image,
      ];
}
