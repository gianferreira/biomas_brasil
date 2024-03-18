import 'package:biomas_brasil/core/validators/field_validators.dart';
import 'package:biomas_brasil/core/widgets/text_form_field.dart';
import 'package:biomas_brasil/core/widgets/text_password_field.dart';
import 'package:flutter/material.dart';

class UserSignInForm extends StatelessWidget with BiomeFormValidations {
  const UserSignInForm({
    super.key,
    required this.formKey,
    required this.userTextController,
    required this.passwordTextController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          BiomeTextFormField(
            label: 'E-mail',
            hintText: 'Insira o seu e-mail',
            maxLines: 1,
            minLines: 1,
            textFieldController: userTextController,
            textInputAction: TextInputAction.next,
            validator: (value) => combine([
              () => isNotEmpty(value),
              () => isEmailValid(value),
            ]),
          ),
          const SizedBox(height: 16.0),
          BiomeTextPasswordField(
            label: 'Senha',
            hintText: 'Insira a sua senha',
            maxLines: 1,
            minLines: 1,
            textFieldController: passwordTextController,
            textInputAction: TextInputAction.done,
            validator: (value) => combine([
              () => isNotEmpty(value),
            ]),
          ),
        ],
      ),
    );
  }
}
