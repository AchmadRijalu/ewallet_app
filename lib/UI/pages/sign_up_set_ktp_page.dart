import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ewallet_app/blocs/bloc/auth_bloc.dart';
import 'package:ewallet_app/models/signup_form_model.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/shared_methods.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignupFormModel data;

  const SignUpSetKtpPage({super.key, required this.data});

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is AuthFailed) {
            showCustomSnacKbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
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
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image = await selectImage();
                            setState(() {
                              selectedImage = image;
                            });
                            print(selectedImage!.name);
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
                                            FileImage(
                                                File(selectedImage!.path))),
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
                            if (validate()) {
                              // Navigator.pushNamed(context, "/sign-up-success");
                              context.read<AuthBloc>().add(AuthRegister(
                                  widget.data.copyWith(
                                      ktp: selectedImage == null
                                          ? ''
                                          : 'data:image/png;base64,' +
                                              base64Encode(
                                                  File(selectedImage!.path)
                                                      .readAsBytesSync()))));
                            } else {
                              showCustomSnacKbar(
                                  context, "Gambar Tidak Boleh Kosong");
                            }
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
                    // Navigator.pushNamed(context, "/sign-up-success");
                    context
                        .read<AuthBloc>()
                        .add(AuthRegister(widget.data.copyWith(ktp: '')));
                  },
                )
              ]);
        },
      ),
    );
  }
}
