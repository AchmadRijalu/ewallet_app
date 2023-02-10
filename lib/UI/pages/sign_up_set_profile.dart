import 'dart:convert';
import 'dart:io';

import 'package:ewallet_app/UI/pages/sign_up_set_ktp_page.dart';
import 'package:ewallet_app/models/signup_form_model.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/shared_methods.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignUpUpSetProfilePage extends StatefulWidget {
  static const routeName = '/sign-up-upload-profile';
  final SignupFormModel data;

  const SignUpUpSetProfilePage({Key? key, required this.data})
      : super(key: key);

  @override
  State<SignUpUpSetProfilePage> createState() => _SignUpUpSetProfilePageState();
}

class _SignUpUpSetProfilePageState extends State<SignUpUpSetProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController pinController = TextEditingController(text: '');
  XFile? selectedImage;

  final _keyState = GlobalKey<FormState>();

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pinController.dispose();
  }

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: lightBackgroundColor,
                            image: selectedImage == null
                                ? null
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        //get File Image path from selected image Xfile
                                        FileImage(File(selectedImage!.path))),
                            shape: BoxShape.circle),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                "assets/icon_upload.png",
                                width: 32,
                                height: 32,
                              )),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.data.name!,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFormField(
                      keyBoardType: TextInputType.number,
                      title: "Set PIN(6 digit number",
                      obscureText: true,
                      controller: pinController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        if (validate()) {
                          // Navigator.pushNamed(context, "/sign-up-set-ktp");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpSetKtpPage(
                                    data: widget.data.copyWith(
                                        pin: pinController.text,
                                        profilePicture: selectedImage == null
                                            ? ''
                                            : 'data:image/png;base64,' +
                                                base64Encode(
                                                    File(selectedImage!.path)
                                                        .readAsBytesSync()))),
                              ));
                        } else {
                          showCustomSnacKbar(context, "PIN Harus 6 Digit");
                        }
                      },
                    )
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
          ]),
    );
  }
}
