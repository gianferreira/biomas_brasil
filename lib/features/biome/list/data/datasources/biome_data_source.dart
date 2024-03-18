import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/core/firebase/firestore_api.dart';
import 'package:biomas_brasil/features/biome/list/data/models/biome_model.dart';
import 'package:biomas_brasil/features/biome/list/domain/entities/biome_entity.dart';

abstract class BiomeDataSource {
  Future<List<BiomeEntity>> loadBiomes();
}

class BiomeDataSourceImpl implements BiomeDataSource {
  final FirestoreAPI api;

  BiomeDataSourceImpl({
    required this.api,
  });

  @override
  Future<List<BiomeEntity>> loadBiomes() async {
    try {
      final response = await api.getBiomes();
      
      return BiomeModel.fromList(response);
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
