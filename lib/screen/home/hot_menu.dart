import 'package:flutter/material.dart';
import 'package:flutter_app/entity/hot_menu.dart';
import 'package:flutter_app/service/home_service.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:flutter_app/utils/system.dart';
import 'package:flutter_app/widget/app_text_heading.dart';
import 'package:flutter_app/widget/app_text_link.dart';

Widget hotMenu(BuildContext context) {
  List<HotMenu> listMenu = getHotMenus();
  final double itemWidth = (getScreenWidth(context) - 42) / 2;
  final double itemHeight = itemWidth / 2 + 60;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: appTextHeading(context, "VinID có gì hot?")),
            appTextLink(text: "Tất cả", action: dummyAction)
          ],
        ),
        SizedBox(height: 10),
        GridView.builder(
          padding: EdgeInsets.zero,
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
    BuildContext context,
    List<HotMenu> listMenu,
    int index,
    ) {
  HotMenu ett = listMenu[index];
  return GestureDetector(
    onTap: dummyAction,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
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
                border: Border(bottom: BorderSide(color: colorBorder)),
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

void dummyAction() {
  print('dummyAction');
}
