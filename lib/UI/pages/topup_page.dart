import 'package:ewallet_app/UI/widgets/bank_item.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/buttons.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top Up")),
      body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Wallet",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/img_wallet.png',
                  width: 80,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "8008 2208 1996",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Angga Rizky",
                      style: greyTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Select Bank",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 14,
            ),
            const BankItem(
              title: "Bank BCA",
              imgUrl: 'assets/img_bank_bca.png',
              isSelected: true,
            ),
            const BankItem(
              title: "Bank BNI",
              imgUrl: 'assets/img_bank_bni.png',
            ),
            const BankItem(
              title: "Bank Mandiri",
              imgUrl: 'assets/img_bank_mandiri.png',
            ),
            const BankItem(
              title: "Bank OCBC",
              imgUrl: 'assets/img_bank_ocbc.png',
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFilledButton(
              title: "Continue",
              onPressed: () {
                Navigator.pushNamed(context, '/topup-amount');
              },
            ),
            const SizedBox(
              height: 57,
            )
          ]),
    );
  }
}
