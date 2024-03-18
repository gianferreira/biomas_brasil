import 'package:biomas_brasil/features/biome/list/domain/entities/biome_entity.dart';
import 'package:biomas_brasil/features/biome/list/presentation/widgets/biome_help.dart';
import 'package:biomas_brasil/features/biome/list/presentation/widgets/biome_item.dart';
import 'package:biomas_brasil/features/user/signout/presentation/widgets/signout_handler.dart';
import 'package:biomas_brasil/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class BiomesListView extends StatelessWidget {
  const BiomesListView({
    super.key,
    required this.biomes,
    required this.user,
  });

  final List<BiomeEntity> biomes;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SignoutHandler(),
        title: const Text(
          'Biomas do Brasil',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        actions: const <Widget>[
          BiomesHelpIcon(),
        ],
      ),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: biomes.length,
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Divider(
              thickness: 0.5,
              height: 1.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
        itemBuilder: (context, index) {
          return BiomeItem(
            biome: biomes[index],
            user: user,
          );
        },
      ),
    );
  }
}
