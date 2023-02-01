import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final bool isSelected;
  const BankItem(
      {super.key,
      required this.title,
      required this.imgUrl,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: isSelected ? blueColor : whiteColor),
          borderRadius: BorderRadius.circular(20),
          color: whiteColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          imgUrl,
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '50 mins',
              style: greyTextStyle.copyWith(fontSize: 12),
            )
          ],
        ),
      ]),
    );
  }
}
