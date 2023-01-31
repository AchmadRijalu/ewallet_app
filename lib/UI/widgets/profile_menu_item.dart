import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? ontap;
  const ProfileMenuItem(
      {super.key, required this.iconUrl, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(children: [
          Image.asset(
            iconUrl,
            width: 24,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )
        ]),
      ),
    );
  }
}
