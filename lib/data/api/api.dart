///Test Server
const String _baseUrl = 'https://abc.com';

class Api {
  Api._();

  ///Dashboard
  static Uri getDashboardEnrolledCourses() {
    return Uri.parse('$_baseUrl/get_enrolled_courses/');
  }
}
