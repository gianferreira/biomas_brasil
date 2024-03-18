import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/core/firebase/firestore_api.dart';
import 'package:biomas_brasil/features/contributions/list/domain/entities/contributions_entity.dart';

abstract class CreateContributionDataSource {
  Future<ContributionEntity> createContribution({
    required ContributionEntity contribution,
  });
}

class CreateContributionDataSourceImpl implements CreateContributionDataSource {
  final FirestoreAPI api;

  CreateContributionDataSourceImpl({
    required this.api,
  });

  @override
  Future<ContributionEntity> createContribution({
    required ContributionEntity contribution,
  }) async {
    try {
      final response = await api.createContribution(
        contribution: contribution, 
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
