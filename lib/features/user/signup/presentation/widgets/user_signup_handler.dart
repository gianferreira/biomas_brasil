import 'package:biomas_brasil/core/navigation/args.dart';
import 'package:biomas_brasil/core/navigation/navigation.dart';
import 'package:biomas_brasil/core/navigation/routes.dart';
import 'package:biomas_brasil/core/widgets/biome_snackbar_error.dart';
import 'package:biomas_brasil/core/widgets/biome_snackbar_success.dart';
import 'package:biomas_brasil/features/user/signup/presentation/stores/signup_controller.dart';
import 'package:biomas_brasil/features/user/signup/presentation/stores/signup_state.dart';
import 'package:flutter/material.dart';

class UserSignUpHandler extends StatelessWidget {
  const UserSignUpHandler({
    super.key,
    required this.signUpController,
    required this.userTextController,
    required this.passwordTextController,
    required this.nameTextController,
    required this.formKey,
  });

  final SignUpController signUpController;
  final TextEditingController nameTextController;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SignUpState>(
      valueListenable: signUpController,
      builder: (context, state, child) {
        if(state is SignUpSuccess) {
          biomeSnackBarSuccess(
            context: context,
            title: 'Usuário criado com sucesso!',
          );

          onboardingNavigateTo(
            context: context, 
            routeName: Routes.biomesList, 
            args: UserArgs(user: state.loggedUser),
          );
        } else if(state is SignUpError) {
          biomeSnackBarError(
            context: context,
            title: state.errorMessage,
            message: 'Por favor, tente prosseguir em alguns instantes',
          );
        }
  
        return FilledButton(
          onPressed: () {
            if(formKey.currentState?.validate() ?? false) {
              signUpController.signUp(
                name: nameTextController.text,
                email: userTextController.text, 
                password: passwordTextController.text,
              );
            }
          }, 
          child: state is SignUpLoading
            ? SizedBox(
                height: 14.0,
                width: 14.0,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.background,
                ),
              )
            : const Text('Crie uma conta'),
        );
      }
    );
  }
}
