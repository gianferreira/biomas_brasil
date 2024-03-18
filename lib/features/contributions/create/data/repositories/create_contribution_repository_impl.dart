import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/features/contributions/create/data/datasources/create_contribution_data_source.dart';
import 'package:biomas_brasil/features/contributions/create/domain/repositories/create_contribution_repository.dart';
import 'package:biomas_brasil/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:dartz/dartz.dart';

class CreateContributionRepositoryImpl implements CreateContributionRepository {
  final CreateContributionDataSource dataSource;

  CreateContributionRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, ContributionEntity>> createContribution({
    required ContributionEntity contribution,
  }) async {
    try {
      final result = await dataSource.createContribution(
        contribution: contribution,
      );

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
