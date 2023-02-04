import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isVerified;
  const TransferRecentUserItem(
      {super.key,
      required this.imgUrl,
      this.isVerified = false,
      required this.name,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Row(children: [
        Container(
          width: 45,
          margin: const EdgeInsets.only(right: 14),
          height: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(imgUrl))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '@${username}',
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        if (isVerified)
          Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 14,
                color: greenColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "Verified",
                style:
                    greenTextStyle.copyWith(fontSize: 11, fontWeight: medium),
              ),
            ],
          )
      ]),
    );
  }
}
