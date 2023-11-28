
const String tableCourseComplete = 'course_complete';

class CourseCompleteFields {
  static final List<String> values = [id, courseTitle, courseId];

  static const String id = '_id';
  static const String courseTitle = 'course_title';
  static const String courseId = 'course_id';
}

class CourseCompleteModel {
  final int? id;
  final String courseTitle;
  final String courseId;

  CourseCompleteModel({
    this.id,
    required this.courseTitle,
    required this.courseId,
  });

  static CourseCompleteModel fromJson(Map<String, Object?> json) =>
      CourseCompleteModel(
        id: json[CourseCompleteFields.id] as int,
        courseTitle: json[CourseCompleteFields.courseTitle] as String,
        courseId: json[CourseCompleteFields.courseId] as String,
      );

  Map<String, Object?> toJson() => {
    CourseCompleteFields.id: id,
    CourseCompleteFields.courseTitle: courseTitle,
    CourseCompleteFields.courseId: courseId,
  };

  CourseCompleteModel copy({
     int? id,
     String? courseTitle,
     String? courseId,
  }) =>
      CourseCompleteModel(
        id: id ?? this.id,
        courseTitle: courseTitle ?? this.courseTitle,
        courseId: courseId ?? this.courseId,
      );
}
