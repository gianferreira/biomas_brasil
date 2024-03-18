import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/features/user/signout/data/datasources/signout_data_source.dart';
import 'package:biomas_brasil/features/user/signout/domain/repositories/signout_repository.dart';
import 'package:dartz/dartz.dart';

class SignoutRepositoryImpl implements SignoutRepository {
  final SignoutDataSource dataSource;

  SignoutRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await dataSource.logout();

      return Right(result);
    } on ServerFailureWithMessage catch (error) {
      return Left(
        ServerFailureWithMessage(error.code, error.message),
      );
    } on ServerFailure catch (error) {
      return Left(
        ServerFailure(error.code),
      );
    }
  }
}
