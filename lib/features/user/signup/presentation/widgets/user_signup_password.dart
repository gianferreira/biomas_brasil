import 'package:biomas_brasil/core/validators/password_validators.dart';
import 'package:biomas_brasil/core/widgets/text_password_field.dart';
import 'package:flutter/material.dart';

class UserSIgnupPassowrdCreatopm extends StatelessWidget with PasswordFormValidations {
  const UserSIgnupPassowrdCreatopm({
    super.key,
    required this.passwordTextController,
  });

  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return BiomeTextPasswordField(
      label: 'Senha',
      hintText: 'Informe a sua senha para acesso',
      maxLines: 1,
      minLines: 1,
      textFieldController: passwordTextController,
      textInputAction: TextInputAction.done,
      validator: (value) => combine([
        () => isNotEmpty(value),
        () => hasMinimumCharacters(value),
        () => hasUppercaseAndLowercase(value),
        () => hasNumericCharacter(value),
        () => hasSpecialCharacter(value),
      ]),
    );
  }
}
