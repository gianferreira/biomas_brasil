import 'package:biomas_brasil/core/arch/use_case.dart';
import 'package:biomas_brasil/features/user/signout/domain/usecases/signout_use_case.dart';
import 'package:biomas_brasil/features/user/signout/presentation/stores/signout_state.dart';
import 'package:flutter/material.dart';

class SignoutController extends ValueNotifier<SignoutState> {
  SignoutController({
    required this.usecase,
  }) : super(SignoutEmpty());

  final SignoutUsecase usecase;

  void logout() async {
    value = SignoutLoading();

    final logoutResult = await usecase(
      NoParams(),
    );

    logoutResult.fold(
      (failure) {
        value = SignoutError(
          errorMessage: failure.message,
        );
      }, 
      (success) {
        value = SignoutSuccess();
      },
    );
  }
}
