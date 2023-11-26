import 'package:edtech_app/features/dashboard/data/models/dashboard_enrolled_courses_model.dart';
import 'package:http/http.dart';

abstract class DashboardRemoteDataSource {
  Future<List<DashboardEnrolledCoursesModel>> getDashboardEnrolledCourses();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Client client;

  DashboardRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DashboardEnrolledCoursesModel>>
      getDashboardEnrolledCourses() async {
    List<DashboardEnrolledCoursesModel> courses = [
      const DashboardEnrolledCoursesModel(
        image: 'https://etienneyamsi.com/img/what-is-an-algorithm.png',
        numberOfModules: 18,
        title: 'Algorithm',
        id: 'course1213',
        instructor: 'Mr. Abc',
        completedModules: 5,
      ),
      const DashboardEnrolledCoursesModel(
        image:
            'https://prepbytes-misc-images.s3.ap-south-1.amazonaws.com/assets/1644826783284-3.%20Data%20Structures.png',
        numberOfModules: 18,
        title: 'Data Structure',
        id: 'course1214',
        instructor: 'Mr. Xyz',
        completedModules: 12,
      ),
    ];
    return courses;
  }
}
