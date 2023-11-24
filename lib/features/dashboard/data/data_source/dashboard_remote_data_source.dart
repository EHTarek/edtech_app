import 'dart:convert';

import 'package:edtech_app/core/error/exception.dart';
import 'package:edtech_app/data/api/api.dart';
import 'package:edtech_app/features/dashboard/data/models/dashboard_enrolled_courses_model.dart';
import 'package:http/http.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardEnrolledCoursesModel> getDashboardEnrolledCourses();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Client client;

  DashboardRemoteDataSourceImpl({required this.client});

  @override
  Future<DashboardEnrolledCoursesModel> getDashboardEnrolledCourses() async {
    final response = await client.get(
      Api.getDashboardEnrolledCourses(),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return DashboardEnrolledCoursesModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw ServerException();
    }
  }
}
