import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/features/contributions/list/domain/entities/contributions_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ContributionRepository {
  Future<Either<Failure, List<ContributionEntity>>> loadContributionsFromBiome({
    required String id,
  });
}
