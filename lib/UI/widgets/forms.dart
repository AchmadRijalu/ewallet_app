import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;

  const CustomFormField(
      {super.key,
      required this.title,
      this.obscureText = false,
      this.controller,
      this.isShowTitle = true});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isShowTitle)
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        ),
      if (isShowTitle)
        SizedBox(
          height: 8,
        ),
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: isShowTitle ? '' : title,
            contentPadding: EdgeInsets.all(12),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
      )
    ]);
  }
}
