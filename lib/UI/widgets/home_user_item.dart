import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeUserItem extends StatelessWidget {
  final String imageUrl;
  final String username;
  const HomeUserItem(
      {super.key, required this.imageUrl, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 13),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageUrl))),
        ),
        Text(
          "@$username",
          style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
        )
      ]),
    );
  }
}
