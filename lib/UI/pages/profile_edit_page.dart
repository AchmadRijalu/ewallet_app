import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomFormField(title: "Username"),

                    SizedBox(
                      height: 16,
                    ),

                    const CustomFormField(title: "Full name"),
                    SizedBox(
                      height: 16,
                    ),
                    //NOTE: EMAIL INPUT
                    CustomFormField(
                      title: "Email Address",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    CustomFilledButton(
                      title: "Update Now",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/profile-edit-success', (route) => false);
                      },
                    ),
                  ],
                )),
          ]),
    );
  }
}
