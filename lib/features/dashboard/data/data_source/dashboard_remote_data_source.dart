import 'package:edtech_app/features/dashboard/data/models/dashboard_course_details_model.dart';
import 'package:edtech_app/features/dashboard/data/models/dashboard_enrolled_courses_model.dart';
import 'package:http/http.dart';

abstract class DashboardRemoteDataSource {
  Future<List<DashboardEnrolledCoursesModel>> getDashboardEnrolledCourses();

  Future<List<DashboardCourseDetailsModel>> getDashboardCourseDetails();
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

  @override
  Future<List<DashboardCourseDetailsModel>> getDashboardCourseDetails() async {
    /* Log log = sl<Log>();
    final response = Api.getDashboardCourseDetails().trim();
    log.debug(title: 'Dashboard Remote Data Source ==> Response', msg: response);
    // var encodedString = jsonEncode(response);
    // log.debug(title: 'Dashboard Remote Data Source ==> Encoded', msg: encodedString);
    Map<String, dynamic> valueMap = await json.decode(response);
    log.debug(title: 'Dashboard Remote Data Source ==> Decoded', msg: valueMap);
    return (valueMap as List)
        .map((e) => DashboardCourseDetailsModel.fromJson(e))
        .toList();*/
    return await Future(
      () => List.generate(
        2,
        (index) => DashboardCourseDetailsModel(
          module: 'Module $index',
          content: List.generate(5, (index) => 'Item $index'),
        ),
      ),
    );
  }
}
