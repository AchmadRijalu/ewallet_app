import 'package:ewallet_app/UI/widgets/buttons.dart';
import 'package:ewallet_app/UI/widgets/profile_menu_item.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Photo",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            child: Column(children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/img_profile.png"))),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: whiteColor),
                    child: Center(
                      child: Icon(
                        Icons.check_circle,
                        color: greenColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Shayna Hanna",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              ),
              const SizedBox(
                height: 40,
              ),
              ProfileMenuItem(
                iconUrl: "assets/icon_editprofile.png",
                title: "Edit Profile",
                ontap: () async {
                  if (await Navigator.pushNamed(context, '/pin') == true) {
                    Navigator.pushNamed(context, '/profile-edit');
                  }
                  ;
                },
              ),
              ProfileMenuItem(
                iconUrl: "assets/icon_pin.png",
                title: "My Pin",
                ontap: () async {
                  if (await Navigator.pushNamed(context, '/pin') == true) {
                    Navigator.pushNamed(context, '/profile-edit-pin');
                  }
                  ;
                },
              ),
              ProfileMenuItem(
                iconUrl: "assets/icon_wallet.png",
                title: "Wallet Settings",
                ontap: () {},
              ),
              ProfileMenuItem(
                iconUrl: "assets/icon_my_reward.png",
                title: "My Reward",
                ontap: () {},
              ),
              ProfileMenuItem(
                iconUrl: "assets/icon_help.png",
                title: "Help Center",
                ontap: () {},
              ),
              ProfileMenuItem(
                iconUrl: "assets/icon_logout.png",
                title: "Log Out",
                ontap: () {},
              )
            ]),
          ),
          const SizedBox(
            height: 87,
          ),
          CustomTextButton(
            title: "Report a Problem",
            onPressed: () {},
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
