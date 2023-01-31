import 'package:ewallet_app/UI/pages/home_page.dart';
import 'package:ewallet_app/UI/pages/onboarding_page.dart';
import 'package:ewallet_app/UI/pages/pin_page.dart';
import 'package:ewallet_app/UI/pages/profile_edit_page.dart';
import 'package:ewallet_app/UI/pages/profile_edit_pin_page.dart';
import 'package:ewallet_app/UI/pages/profile_edit_success_page.dart';
import 'package:ewallet_app/UI/pages/profile_page.dart';
import 'package:ewallet_app/UI/pages/sign_in_page.dart';
import 'package:ewallet_app/UI/pages/sign_up_page.dart';
import 'package:ewallet_app/UI/pages/sign_up_success_page.dart';

import 'package:ewallet_app/UI/pages/splash_page.dart';
import 'package:ewallet_app/UI/pages/topup_page.dart';
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
        scaffoldBackgroundColor: lightBackgroundColor,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          centerTitle: true,
          backgroundColor: lightBackgroundColor,
          iconTheme: IconThemeData(color: blackColor),
          elevation: 0,
        ),
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-upload-profile': (context) => const SignUpUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/pin': (context) => const PinPage(),
        '/profile-edit': (context) => const ProfileEditPage(),
        '/profile-edit-pin': (context) => const ProfileEditPinPage(),
        '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
        '/topup': (context) => const TopUpPage()
      },
    );
  }
}
