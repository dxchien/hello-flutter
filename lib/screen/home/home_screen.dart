import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home/main_menu.dart';
import 'package:flutter_app/screen/home/search_area.dart';
import 'package:flutter_app/screen/home/top_ad.dart';
import 'package:flutter_app/screen/home/wallet_area.dart';

import '../../utils/system.dart';
import 'fomoMenu.dart';
import 'hot_menu.dart';

typedef void MyCallBack(BuildContext context);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, child: topDecor(context)),
          Positioned(child: buildBody(context))
        ],
      ),
    );
  }
}

Widget topDecor(BuildContext context) {
  return Container(
    width: getScreenWidth(context),
    height: getScreenHeight(context),
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

Widget buildBody(BuildContext context) {
  return SingleChildScrollView(
    child: SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  searchArea(context),
                  SizedBox(height: 20),
                  topAd(context),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  walletArea(context),
                  SizedBox(height: 20),
                  mainMenu(context),
                  SizedBox(height: 30),
                  fomoMenu(context),
                  SizedBox(height: 30),
                  hotMenu(context),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



