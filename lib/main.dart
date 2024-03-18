import 'package:biomas_brasil/core/arch/dependency_injector.dart';
import 'package:biomas_brasil/core/navigation/routes.dart';
import 'package:biomas_brasil/core/theme/theme.dart';
import 'package:biomas_brasil/features/user/signin/presentation/pages/user_signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BiomesApp());
}

class BiomesApp extends StatelessWidget {
  const BiomesApp({super.key});

  @override
  Widget build(BuildContext context) {
    DependencyInjector.initDependencies();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: biomeTheme,
      home: const UserSignInPage(),
      routes: Routes.builders,
    );
  }
}
