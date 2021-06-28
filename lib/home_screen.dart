import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/entity/fomo_menu.dart';
import 'package:flutter_app/utils/entity/hot_menu.dart';
import 'package:flutter_app/utils/service/home_service.dart';
import 'package:flutter_app/utils/formatter.dart';
import 'package:flutter_app/utils/entity/main_menu.dart';
import 'package:flutter_app/utils/widget/app_text_heading.dart';
import 'package:flutter_app/utils/widget/app_text_link.dart';

import 'utils/color.dart';
import 'utils/system.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: buildBody(context),
      ),
    );
  }
}

Widget buildBody(BuildContext context) {
  return SafeArea(
    child: Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xfff9def1),
                      Colors.white,
                    ]),
              ),
              child: Column(
                children: [
                  buildSearchArea(),
                  SizedBox(height: 20),
                  buildTopAd(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  buildWallet(),
                  SizedBox(height: 20),
                  buildMainMenu(),
                  SizedBox(height: 30),
                  buildFomoMenu(context),
                  SizedBox(height: 30),
                  buildHotMenu(context),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildHotMenu(BuildContext context) {
  List<HotMenu> listMenu = getHotMenus();
  final double itemWidth = (getScreenWidth(context) - 42) / 2;
  final double itemHeight = itemWidth / 2 + 60;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: appTextHeading("VinID có gì hot?")),
            appTextLink(text: "Tất cả", action: dummyAction)
          ],
        ),
        SizedBox(height: 10),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) {
            return buildHotMenuItem(ctx, listMenu, index);
          },
          itemCount: listMenu.length,
          shrinkWrap: true,
          primary: false,
        ),
      ],
    ),
  );
}

Widget buildHotMenuItem(
    BuildContext context, List<HotMenu> listMenu, int index) {
  HotMenu ett = listMenu[index];
  return GestureDetector(
    onTap: dummyAction,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: inputBorder),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: inputBorder)),
              ),
              child: Image.asset("assets/${ett.image}"),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Text(
                ett.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    ),
  );
}

Widget buildFomoMenu(BuildContext context) {
  List<FomoMenu> listMenu = getFomoMenus();
  final double itemWidth = (getScreenWidth(context) - 42) / 2;
  final double itemHeight = itemWidth + 65;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appTextHeading("Đừng bỏ lỡ"),
        SizedBox(height: 10),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) {
            return buildFomoMenuItem(ctx, listMenu, index);
          },
          itemCount: listMenu.length,
          shrinkWrap: true,
          primary: false,
        ),
      ],
    ),
  );
}

Widget buildFomoMenuItem(
    BuildContext context, List<FomoMenu> listMenu, int index) {
  FomoMenu ett = listMenu[index];
  return GestureDetector(
    onTap: dummyAction,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: inputBorder),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: inputBorder)),
              ),
              child: Image.asset("assets/${ett.image}"),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ett.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                Color(0xffdc5752),
                                Color(0xffb43a33),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: CircleAvatar(
                        child: Icon(
                          ett.btnIcon,
                          color: Colors.white,
                          size: 12,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        ett.btnText,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3c5483),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildMainMenu() {
  List<MainMenu> listMenu = getMainMenus();
  return Column(
    children: [
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.9,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (ctx, index) {
          return buildMainMenuItem(listMenu, index);
        },
        itemCount: listMenu.length,
        shrinkWrap: true,
        primary: false,
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appTextLink(text: "Xem tất cả dịch vụ", action: allServiceAction),
          SizedBox(width: 8),
          Badge(
            toAnimate: false,
            shape: BadgeShape.square,
            badgeColor: Colors.red,
            borderRadius: BorderRadius.circular(100),
            badgeContent: Text(' +2 ', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ],
  );
}

Widget buildMainMenuItem(List<MainMenu> listMenu, int index) {
  MainMenu ett = listMenu[index];
  return Container(
    child: Column(
      children: [
        Container(
          width: 48,
          height: 48,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                child: Image.asset("assets/${ett.image}"),
              ),
              if (ett.isHot) ...[
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 16,
                    child: Image.asset(
                      "assets/ic_function_hot.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
        SizedBox(height: 2),
        Text(
          ett.name,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget buildWallet() {
  return Row(
    children: [
      Expanded(
        child: wallet(
          prefixIcon: Icons.verified,
          suffixIcon: Icons.chevron_right,
          title: "Điểm tích luỹ",
          balance: formatInt(5300),
          action: accumulatedPointsAction,
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: wallet(
          suffixIcon: Icons.add,
          prefixIcon: Icons.account_balance_wallet,
          title: "Ví của tôi",
          balance: formatCurrency(0),
          action: accumulatedPointsAction,
        ),
      )
    ],
  );
}

Widget wallet({
  required IconData prefixIcon,
  required IconData suffixIcon,
  required String title,
  required String balance,
  required VoidCallback action,
}) {
  return GestureDetector(
    child: Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(color: inputBorder),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Icon(prefixIcon, color: textLink)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    title,
                    style: TextStyle(color: textHint),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    balance,
                    style: TextStyle(color: textGrey, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(2),
              child: Icon(suffixIcon, color: textLink)),
        ],
      ),
    ),
  );
}

Widget buildTopAd() {
  return Container(
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTextHeading("Giảm tới 40% Trà vải tươi dầm Phúc Long"),
                Container(
                  height: 36,
                  child: appTextLink(text: "Nhận ngay", action: getNowAction),
                )
              ],
            ),
          ),
        ),
        Image.asset(
          "assets/phuclong.png",
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
}

Widget buildSearchArea() {
  return Container(
    height: 46,
    child: Row(
      children: [
        Expanded(
          child: TextField(
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            inputFormatters: [LengthLimitingTextInputFormatter(100)],
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search, color: textGrey),
              hintText: "Bạn đang muốn tìm ...",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: inputBorder),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: inputBorder),
                borderRadius: BorderRadius.circular(50),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          ),
        ),
        SizedBox(width: 6),
        Container(
          width: 46,
          height: 46,
          child: ElevatedButton(
            onPressed: giftButtonAction,
            child: Icon(
              Icons.card_giftcard,
              color: textGrey,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: inputBorder),
              ),
              padding: EdgeInsets.all(0),
              primary: Colors.white,
              shadowColor: Colors.transparent,
            ),
          ),
        )
      ],
    ),
  );
}

Widget topDecor() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, -0.5),
          colors: [
            Color(0xfff9def1),
            Colors.white,
          ]),
    ),
  );
}

void giftButtonAction() {
  print('giftButtonAction');
}

void getNowAction() {
  print('getNowAction');
}

void accumulatedPointsAction() {
  print('accumulatedPointsAction');
}

void allServiceAction() {
  print('allServiceAction');
}

void dummyAction() {
  print('dummyAction');
}
