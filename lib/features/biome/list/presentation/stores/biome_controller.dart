import 'package:biomas_brasil/core/arch/use_case.dart';
import 'package:biomas_brasil/features/biome/list/domain/usecases/load_biomes_use_case.dart';
import 'package:biomas_brasil/features/biome/list/presentation/stores/biome_state.dart';
import 'package:flutter/material.dart';

class BiomeController extends ValueNotifier<BiomeState> {
  BiomeController({
    required this.usecase,
  }) : super(BiomeEmpty());

  final LoadBiomesUsecase usecase;

  void loadBiomes() async {
    value = BiomeLoading();

    final loadBiomesResult = await usecase(NoParams());

    loadBiomesResult.fold(
      (failure) {
        value = BiomeError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = BiomeSuccess(
          biomes: success,
        );
      },
    );
  }
}
