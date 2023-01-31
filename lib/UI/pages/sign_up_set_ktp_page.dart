import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignUpSetKtpPage extends StatelessWidget {
  const SignUpSetKtpPage({super.key});

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
              "Verify Your\nAccount",
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: lightBackgroundColor, shape: BoxShape.circle),
                      child: Center(
                          child: Image.asset(
                        "assets/icon_upload.png",
                        width: 32,
                        height: 32,
                      )),
                    ),
                    // Container(
                    //   width: 120,
                    //   height: 120,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: AssetImage("assets/img_profile.png"))),
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Passport/ID Card",
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        Navigator.pushNamed(context, "/sign-up-success");
                      },
                    )
                  ],
                )),
            const SizedBox(
              height: 60,
            ),
            CustomTextButton(
              title: "Skip for Now",
              onPressed: () {
                Navigator.pushNamed(context, "/sign-up-success");
              },
            )
          ]),
    );
  }
}
