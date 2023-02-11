import 'package:ewallet_app/UI/widgets/buttons.dart';
import 'package:ewallet_app/UI/widgets/forms.dart';
import 'package:ewallet_app/UI/widgets/transfer_recent_user_item.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/transfer_result_user_item.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transfer")),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          children: [
            Text(
              "Search",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 14,
            ),
            CustomFormField(
              title: 'by username',
              isShowTitle: false,
            ),
            // buildRecentUsers(context),
            buildResultUsers(context),
            const SizedBox(
              height: 274,
            ),
            CustomFilledButton(
              title: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, '/transfer-amount');
              },
            ),
            const SizedBox(
              height: 50,
            )
          ]),
    );
  }

  Widget buildRecentUsers(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Recent Users",
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        const TransferRecentUserItem(
            imgUrl: 'assets/img_friend1.png',
            isVerified: true,
            name: 'Yonna Jie',
            username: 'yoenna'),
        const TransferRecentUserItem(
            imgUrl: 'assets/img_friend2.png', name: 'John Hi', username: 'jhi'),
        const TransferRecentUserItem(
            imgUrl: 'assets/img_friend3.png',
            name: 'Masayoshi',
            username: 'form')
      ]),
    );
  }

  Widget buildResultUsers(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Result",
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        Wrap(
          spacing: 17,
          runSpacing: 17,
          children: [
            const TransferResultUserItem(
                imgUrl: 'assets/img_friend1.png',
                isVerified: true,
                name: 'Yonna Jie',
                isSelected: true,
                userName: 'yoenna'),
            const TransferResultUserItem(
                imgUrl: 'assets/img_friend3.png',
                isVerified: false,
                name: 'Yonne ka',
                userName: 'yoen yu'),
            const TransferResultUserItem(
                imgUrl: 'assets/img_friend2.png',
                isVerified: false,
                name: 'Yonne ka',
                userName: 'yoen yu'),
            const TransferResultUserItem(
                imgUrl: 'assets/img_friend2.png',
                isVerified: false,
                name: 'Yonne ka',
                userName: 'yoen yu'),
          ],
        )
      ]),
    );
  }
}
