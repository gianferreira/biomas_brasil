import 'package:biomas_brasil/core/navigation/args.dart';
import 'package:biomas_brasil/core/navigation/navigation.dart';
import 'package:biomas_brasil/core/navigation/routes.dart';
import 'package:biomas_brasil/core/widgets/biome_snackbar_error.dart';
import 'package:biomas_brasil/core/widgets/biome_snackbar_success.dart';
import 'package:biomas_brasil/features/biome/list/domain/entities/biome_entity.dart';
import 'package:biomas_brasil/features/contributions/create/presentation/stores/create_contribution_controller.dart';
import 'package:biomas_brasil/features/contributions/create/presentation/stores/create_contribution_state.dart';
import 'package:biomas_brasil/features/user/signup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class CreateContributionHandler extends StatelessWidget {
  const CreateContributionHandler({
    super.key,
    required this.formKey,
    required this.descriptionController,
    required this.titleController,
    required this.createContributionController,
    required this.biome,
    required this.user,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final CreateContributionController createContributionController;
  final BiomeEntity biome;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CreateContributionState>(
      valueListenable: createContributionController,
      builder: (context, state, child) {
        if(state is CreateContributionSuccess) {
          biomeSnackBarSuccess(
            context: context,
            title: 'Contribuição criada com sucesso!',
          );

          onboardingNavigateTo(
            context: context, 
            routeName: Routes.biomesDetails,
            twoPops: true,
            args: BiomeArgs(
              user: user,
              biome: biome
            ),
          );
        } else if(state is CreateContributionError) {
          biomeSnackBarError(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: FilledButton(
            onPressed: () {
              if(formKey.currentState?.validate() ?? false) {
                createContributionController.createContribution(
                  biome: biome,
                  user: user,
                  description: descriptionController.text,
                  title: titleController.text,
                );
              }
            },
            child: state is CreateContributionLoading
              ? SizedBox(
                  height: 14.0,
                  width: 14.0,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
              : const Text('Concluir'),
          ),
        );
      }
    );
  }
}
