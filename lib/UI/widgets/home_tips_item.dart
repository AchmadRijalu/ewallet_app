import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;

  const HomeTipsItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.url});
  // _openSourceCode() async {
  //   var url = Uri.parse('https://github.com/AchmadRijalu/doLite');

  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw "Could not launch $url";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse(url));
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              imageUrl,
              width: 155,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
        ]),
      ),
    );
  }
}
