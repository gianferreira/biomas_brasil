import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CreateContributionRepository {
  Future<Either<Failure, ContributionEntity>> createContribution({
    required ContributionEntity contribution,
  });
}
