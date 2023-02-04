import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_services_item.dart';

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: lightBackgroundColor),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Do More With Us",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 13,
          ),
          Wrap(
            spacing: 29,
            runSpacing: 25,
            children: [
              HomeServiceItem(
                iconUrl: "assets/icon_product_data.png",
                title: "Data",
                onTap: () {
                  Navigator.pushNamed(context, '/data-provider');
                },
              ),
              HomeServiceItem(
                iconUrl: "assets/icon_product_water.png",
                title: "Water",
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: "assets/icon_product_stream.png",
                title: "Stream",
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: "assets/icon_product_movie.png",
                title: "Movie",
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: "assets/icon_product_food.png",
                title: "Food",
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: "assets/icon_product_travel.png",
                title: "Travel",
                onTap: () {},
              )
            ],
          )
        ]),
      ),
    );
  }
}
