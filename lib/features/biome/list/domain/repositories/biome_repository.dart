import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/features/biome/list/domain/entities/biome_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BiomeRepository {
  Future<Either<Failure, List<BiomeEntity>>> loadBiomes();
}
