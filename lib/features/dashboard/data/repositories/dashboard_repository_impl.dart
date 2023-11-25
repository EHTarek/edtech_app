import 'package:edtech_app/core/error/exception.dart';
import 'package:edtech_app/core/error/failure.dart';
import 'package:edtech_app/core/network/network_info.dart';
import 'package:edtech_app/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:edtech_app/features/dashboard/domain/entities/dashboard_enrolled_courses_entity.dart';
import 'package:edtech_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final NetworkInfo networkInfo;
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<DashboardEnrolledCoursesEntity>>>
      getDashboardEnrolledCourses() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getDashboardEnrolledCourses());
      } on UnauthorizedException {
        return const Left(TokenInvalid(message: 'Invalid Token'));
      } catch (_) {
        return const Left(ServerFailure(message: 'Something went wrong!'));
      }
    } else {
      return const Left(ConnectionFailure(message: 'No Internet Connection!'));
    }
  }
}
