import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 155,
              height: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img_logo_light.png"))),
              margin: EdgeInsets.only(top: 100, bottom: 100),
            ),
            Text(
              "Join us to Unlock\nYour Growth",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE : FULL NAME INPUT
                    const CustomFormField(title: "Full Name"),

                    SizedBox(
                      height: 16,
                    ),
                    //NOTE: EMAIL INPUT
                    const CustomFormField(title: "Email Address"),

                    SizedBox(
                      height: 16,
                    ),
                    //NOTE: EMAIL INPUT
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        Navigator.pushNamed(context, "/sign-up-upload-profile");
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
              title: "Sign In",
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
            )
          ]),
    );
  }
}
