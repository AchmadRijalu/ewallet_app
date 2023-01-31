import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfileEditPinPage extends StatelessWidget {
  const ProfileEditPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit PIN")),
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
                    const CustomFormField(title: "Old Pin"),
                    SizedBox(
                      height: 16,
                    ),
                    const CustomFormField(title: "New PIN"),
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
