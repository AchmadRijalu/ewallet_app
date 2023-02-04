import 'package:ewallet_app/UI/widgets/buttons.dart';
import 'package:ewallet_app/UI/widgets/forms.dart';
import 'package:ewallet_app/UI/widgets/package_item.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/transfer_result_user_item.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paket Data")),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Phone Number",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 14,
            ),
            CustomFormField(
              title: "+628",
              isShowTitle: false,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Select Package",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 14,
            ),
            Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                PackageItem(amount: 10, price: 100000),
                PackageItem(amount: 25, price: 420000),
                PackageItem(
                  amount: 40,
                  price: 25000000,
                  isSelected: true,
                ),
                PackageItem(amount: 99, price: 50000000)
              ],
            ),
            const SizedBox(
              height: 85,
            ),
            CustomFilledButton(
                title: "Continue",
                onPressed: () async {
                  if (await Navigator.pushNamed(context, '/pin') == true) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/data-success', (route) => false);
                  }
                }),
            const SizedBox(
              height: 57,
            ),
          ]),
    );
  }
}
