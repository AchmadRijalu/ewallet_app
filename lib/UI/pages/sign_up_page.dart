import 'package:ewallet_app/shared/shared_methods.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomFormField(
                      title: "Full Name",
                      controller: nameController,
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    //NOTE: EMAIL INPUT
                    CustomFormField(
                      title: "Email Address",
                      controller: emailController,
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    //NOTE: EMAIL INPUT
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                      controller: emailController,
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        if (validate()) {
                          Navigator.pushNamed(
                              context, "/sign-up-upload-profile");
                        } else {
                          showCustomSnacKbar(
                              context, "Semua field harus diisi!");
                        }
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
            ),
            const SizedBox(
              height: 30,
            ),
          ]),
    );
  }
}
