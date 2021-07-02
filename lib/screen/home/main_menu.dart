
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity/main_menu.dart';
import 'package:flutter_app/service/home_service.dart';
import 'package:flutter_app/widget/app_text_link.dart';

Widget mainMenu(BuildContext context) {
  List<MainMenu> listMenu = getMainMenus();
  return Column(
    children: [
      GridView.builder(
        padding: EdgeInsets.zero,
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

void allServiceAction() {
  print('allServiceAction');
}