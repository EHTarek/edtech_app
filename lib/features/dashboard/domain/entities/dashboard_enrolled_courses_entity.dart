import 'package:equatable/equatable.dart';

class DashboardEnrolledCoursesEntity extends Equatable {
  final String id;
  final String title;
  final int numberOfModules;
  final String image;

  const DashboardEnrolledCoursesEntity({
    required this.id,
    required this.title,
    required this.numberOfModules,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "numberOfModules": numberOfModules,
        "image": image,
      };

  @override
  List<Object?> get props => [id, title, numberOfModules, image];
}
