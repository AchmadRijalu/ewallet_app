import 'package:ewallet_app/UI/widgets/home_latest_transaction_item.dart';
import 'package:ewallet_app/UI/widgets/home_services_item.dart';
import 'package:ewallet_app/UI/widgets/home_tips_item.dart';
import 'package:ewallet_app/UI/widgets/home_user_item.dart';
import 'package:ewallet_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 6,
        color: whiteColor,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            backgroundColor: whiteColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: blueColor,
            unselectedItemColor: blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle:
                blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            unselectedLabelStyle:
                blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icon_overview.png",
                    color: blueColor,
                    width: 20,
                  ),
                  label: "Overview"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icon_history.png",
                    width: 20,
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icon_statistic.png",
                    width: 20,
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icon_reward.png",
                    width: 20,
                  ),
                  label: "Reward")
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: puprleColor,
        onPressed: () {},
        child: Image.asset(
          "assets/icon_plus_circle.png",
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            buildProfile(),
            buildWalletCard(),
            buildLevel(),
            buildServices(),
            buildLatestTransaction(),
            buildSendAgain(),
            buildFriendlyTips()
          ]),
    );
  }
}

Widget buildProfile() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Howdy",
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Shaynahan",
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
          ],
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage("assets/img_profile.png"))),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 16,
              height: 16,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: whiteColor),
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  color: greenColor,
                  size: 14,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildWalletCard() {
  return Container(
    width: double.infinity,
    height: 220,
    margin: const EdgeInsets.only(top: 30),
    padding: const EdgeInsets.all(30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/img_bg_card.png"))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Shayna Hanna",
        style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      const SizedBox(
        height: 28,
      ),
      Text(
        "**** **** **** 1280",
        style: whiteTextStyle.copyWith(
            fontSize: 18, fontWeight: medium, letterSpacing: 6),
      ),
      const SizedBox(
        height: 21,
      ),
      Text(
        "Balance",
        style: whiteTextStyle,
      ),
      Text(
        "RP.12.500",
        style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
      )
    ]),
  );
}

Widget buildLevel() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: whiteColor),
    child: Column(children: [
      Row(
        children: [
          Text(
            "Level 1",
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
          const Spacer(),
          Text(
            "55%",
            style: greenTextStyle.copyWith(fontWeight: semiBold),
          ),
          Text(
            " of Rp 20.000",
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          )
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(55),
        child: LinearProgressIndicator(
          minHeight: 5,
          value: 0.55,
          valueColor: AlwaysStoppedAnimation(greenColor),
          backgroundColor: lightBackgroundColor,
        ),
      )
    ]),
  );
}

Widget buildServices() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Do Something",
        style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeServiceItem(
            iconUrl: "assets/icon_topup.png",
            title: "Top Up",
            onTap: () {},
          ),
          HomeServiceItem(
            iconUrl: "assets/icon_send.png",
            title: "Send",
            onTap: () {},
          ),
          HomeServiceItem(
            iconUrl: "assets/icon_withdraw.png",
            title: "Withdraw",
            onTap: () {},
          ),
          HomeServiceItem(
            iconUrl: "assets/icon_more.png",
            title: "More",
            onTap: () {},
          )
        ],
      )
    ]),
  );
}

Widget buildLatestTransaction() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Latest Transaction",
        style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
      Container(
        margin: const EdgeInsets.only(top: 14),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: Column(children: [
          HomeLatestTransactionItem(
              iconUrl: "assets/icon_transaction_category1.png",
              title: "Top Up",
              time: "Yesterday",
              value: "+ 450.000"),
          HomeLatestTransactionItem(
              iconUrl: "assets/icon_transaction_category2.png",
              title: "Cashback",
              time: "Sep 11",
              value: "+ 22.000"),
          HomeLatestTransactionItem(
              iconUrl: "assets/icon_transaction_category3.png",
              title: "Withdraw",
              time: "Sep 2",
              value: "- 5000"),
          HomeLatestTransactionItem(
              iconUrl: "assets/icon_transaction_category4.png",
              title: "Transfer",
              time: "Aug 27",
              value: "- 123.500"),
          HomeLatestTransactionItem(
              iconUrl: "assets/icon_transaction_category5.png",
              title: "Electric",
              time: "Feb 18",
              value: "- 12.300.00"),
        ]),
      )
    ]),
  );
}

Widget buildSendAgain() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Send Again",
        style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
      const SizedBox(
        height: 14,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            HomeUserItem(
                imageUrl: "assets/img_friend1.png", username: "Yuanita"),
            HomeUserItem(imageUrl: "assets/img_friend2.png", username: "Jani"),
            HomeUserItem(imageUrl: "assets/img_friend3.png", username: "Urip"),
            HomeUserItem(imageUrl: "assets/img_friend4.png", username: "Masa")
          ],
        ),
      )
    ]),
  );
}

Widget buildFriendlyTips() {
  return Container(
    margin: const EdgeInsets.only(top: 30, bottom: 50),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Friendly Tips",
        style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
      SizedBox(
        height: 14,
      ),
      Wrap(
        spacing: 17,
        runSpacing: 18,
        children: [
          HomeTipsItem(
              imageUrl: "assets/img_tips1.png",
              title: "Best tips for using a credit card",
              url: "https://pub.dev/packages/url_launcher"),
          HomeTipsItem(
              imageUrl: "assets/img_tips2.png",
              title: "Spot the good pie of finance model",
              url: "https://google.com"),
          HomeTipsItem(
              imageUrl: "assets/img_tips3.png",
              title: "Great hack to get better advices",
              url: ""),
          HomeTipsItem(
              imageUrl: "assets/img_tips4.png",
              title: "Save more penny buy this instead",
              url: "https://google.com")
        ],
      )
    ]),
  );
}
