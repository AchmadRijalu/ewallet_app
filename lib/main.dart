import 'package:ewallet_app/UI/pages/onboarding_page.dart';
import 'package:ewallet_app/UI/pages/sign_in_page.dart';
import 'package:ewallet_app/UI/pages/sign_up_page.dart';
import 'package:ewallet_app/UI/pages/sign_up_success_page.dart';

import 'package:ewallet_app/UI/pages/splash_page.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'UI/pages/sign_up_SET_profile.dart';
import 'UI/pages/sign_up_set_ktp_page.dart';

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
        '/sign-up-upload-profile': (context) => const SignUpUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage()
      },
    );
  }
}
