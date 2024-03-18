import 'package:biomas_brasil/core/navigation/args.dart';
import 'package:biomas_brasil/features/contributions/create/presentation/pages/create_contribution_view.dart';
import 'package:flutter/material.dart';

class CreateContributionPage extends StatelessWidget {
  const CreateContributionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BiomeArgs args = ModalRoute.of(context)?.settings.arguments as BiomeArgs;

    return CreateContributionView(
      biome: args.biome,
      user: args.user,
    );
  }
}
