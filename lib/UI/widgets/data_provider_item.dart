import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DataProviderItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  final bool isSelected;
  const DataProviderItem(
      {super.key,
      required this.name,
      required this.imgUrl,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          border: isSelected ? Border.all(color: blueColor, width: 2) : null,
          color: whiteColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          imgUrl,
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              name,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Available",
              style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            )
          ],
        )
      ]),
    );
  }
}
