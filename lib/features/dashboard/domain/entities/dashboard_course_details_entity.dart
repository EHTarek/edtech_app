import 'package:equatable/equatable.dart';

class DashboardCourseDetailsEntity extends Equatable {
  final String module;
  final List<String> content;

  const DashboardCourseDetailsEntity({
    required this.module,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
    "module": module,
    "content": List<dynamic>.from(content.map((x) => x)),
  };

  @override
  List<Object?> get props => [module, content];
}
