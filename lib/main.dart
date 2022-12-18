import 'package:ewallet_app/UI/pages/onboarding_page.dart';
import 'package:ewallet_app/UI/pages/sign_in_page.dart';
import 'package:ewallet_app/UI/pages/sign_up_page.dart';
import 'package:ewallet_app/UI/pages/sign_up_upload_profile.dart';
import 'package:ewallet_app/UI/pages/splash_page.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-upload-profile': (context) => const SignUpUploadProfilePage()
      },
    );
  }
}
