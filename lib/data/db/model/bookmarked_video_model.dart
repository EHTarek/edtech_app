
const String tableBookmarkedVideo = 'bookmarked_video';

class BookMarkedVideoFields {
  static final List<String> values = [id, title, time, link];

  static const String id = '_id';
  static const String title = 'title';
  static const String time = 'time';
  static const String link = 'link';
}

class BookmarkedVideoModel {
  final int? id;
  final String title;
  final String time;
  final String link;

  BookmarkedVideoModel({
    this.id,
    required this.title,
    required this.time,
    required this.link,
  });

  static BookmarkedVideoModel fromJson(Map<String, Object?> json) =>
      BookmarkedVideoModel(
        id: json[BookMarkedVideoFields.id] as int,
        title: json[BookMarkedVideoFields.title] as String,
        time: json[BookMarkedVideoFields.time] as String,
        link: json[BookMarkedVideoFields.link] as String,
      );

  Map<String, Object?> toJson() => {
    BookMarkedVideoFields.id: id,
    BookMarkedVideoFields.title: title,
    BookMarkedVideoFields.time: time,
    BookMarkedVideoFields.link: link,
  };

  BookmarkedVideoModel copy({
    int? id,
    String? title,
    String? time,
    String? link,
  }) =>
      BookmarkedVideoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        time: time ?? this.time,
        link: link ?? this.link,
      );
}
