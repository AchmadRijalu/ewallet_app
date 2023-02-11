import 'dart:async';

import 'package:ewallet_app/UI/pages/onboarding_page.dart';
import 'package:ewallet_app/blocs/bloc/auth_bloc.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // @override
    // void initState() {
    //   // TODO: implement initState
    //   super.initState();

    //   Timer(
    //       const Duration(seconds: 3),
    //       (() => Navigator.pushNamedAndRemoveUntil(
    //           context, '/onboarding', (route) => false)));
    // }
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
          if (state is AuthFailed) {
            print(state.props);
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Center(
            child: Container(
          width: 155,
          height: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img_logo_dark.png"))),
        )),
      ),
    );
  }
}
