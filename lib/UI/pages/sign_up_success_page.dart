import 'package:ewallet_app/UI/pages/home_page.dart';
import 'package:ewallet_app/UI/widgets/buttons.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Akun Berhasil\nTerdaftar",
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          SizedBox(
            height: 26,
          ),
          Text(
            "Grow your finance start\ntogether with us",
            style: greyTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: "Get Started",
            width: 183,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
          )
        ],
      )),
    );
  }
}
