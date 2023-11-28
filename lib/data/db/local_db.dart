import 'package:edtech_app/data/db/model/bookmarked_video_model.dart';
import 'package:edtech_app/data/db/model/course_complete_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
const boolType = 'BOOLEAN NOT NULL';
const intType = 'INTEGER NOT NULL';
// const doubleType = 'FLOAT NOT NULL';
const textType = 'TEXT NOT NULL';

class LocalDbImpl {
  LocalDbImpl._init();

  static final LocalDbImpl instance = LocalDbImpl._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('ed_tech_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableBookmarkedVideo (
    ${BookMarkedVideoFields.id} $idType,
    ${BookMarkedVideoFields.title} $textType,
    ${BookMarkedVideoFields.time} $textType,
    ${BookMarkedVideoFields.link} $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableCourseComplete (
    ${CourseCompleteFields.id} $idType,
    ${CourseCompleteFields.courseTitle} $textType,
    ${CourseCompleteFields.courseId} $textType
    )
    ''');
  }

  /// Bookmark Video Time
  //Create Bookmark
  Future<BookmarkedVideoModel> createBookmark(
      BookmarkedVideoModel bookMarkedVideoModel) async {
    final db = await instance.database;
    final id =
        await db.insert(tableBookmarkedVideo, bookMarkedVideoModel.toJson());
    return bookMarkedVideoModel.copy(id: id);
  }

  //Read All Bookmark
  Future<List<BookmarkedVideoModel>> readAllBookmarked() async {
    final db = await instance.database;
    final result = await db.rawQuery(
      'SELECT * FROM $tableBookmarkedVideo',
    );
    if (result.isNotEmpty) {
      return result.map((json) => BookmarkedVideoModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  //Delete Bookmark
  Future<void> deleteBookmarkedVideo(
      BookmarkedVideoModel bookMarkedVideoModel) async {
    final db = await instance.database;

    await db.rawQuery(
      'DELETE FROM $BookMarkedVideoFields WHERE ${BookMarkedVideoFields.id}=${bookMarkedVideoModel.id}',
    );
  }

  /// Save Course Completed or not
  //Create Course Completed
  Future<CourseCompleteModel> createCourseComplete(
      CourseCompleteModel completeModel) async {
    final db = await instance.database;
    final id = await db.insert(tableCourseComplete, completeModel.toJson());
    return completeModel.copy(id: id);
  }

  //Read Course Completed
  Future<List<CourseCompleteModel>> readAllCourseComplete() async {
    final db = await instance.database;
    final result = await db.rawQuery(
      'SELECT * FROM $tableCourseComplete',
    );
    if (result.isNotEmpty) {
      return result.map((json) => CourseCompleteModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  //Delete Course Completed
  Future<void> deleteCourseComplete(CourseCompleteModel completeModel) async {
    final db = await instance.database;

    await db.rawQuery(
      'DELETE FROM $CourseCompleteFields WHERE ${CourseCompleteFields.id}=${completeModel.id}',
    );
  }
}
