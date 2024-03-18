import 'package:biomas_brasil/core/navigation/args.dart';
import 'package:flutter/material.dart';

// ignore_for_file: use_build_context_synchronously

Widget onboardingNavigateTo({
  required BuildContext context,
  required String routeName,
  Args? args,
  bool twoPops = false,
}) {
  navigateCallback(
    context: context,
    routeName: routeName,
    args: args,
    twoPops: twoPops,
  );

  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
  );
}

Future<void> navigateCallback({
  required BuildContext context,
  required String routeName,
  Args? args,
  bool twoPops = false,
}) async {
  await Future.delayed(Duration.zero);

  if(twoPops) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  Navigator.of(context).pushNamed(
    routeName,
    arguments: args,
  ); 
}
