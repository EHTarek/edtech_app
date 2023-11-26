import 'package:equatable/equatable.dart';

class DashboardCourseDetailsEntity extends Equatable {
  final String moduleName;
  final List<String> moduleContent;

  const DashboardCourseDetailsEntity({
    required this.moduleName,
    required this.moduleContent,
  });

  @override
  List<Object?> get props => [moduleName, moduleContent];
}

