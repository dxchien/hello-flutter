import 'package:flutter/material.dart';
import 'package:flutter_app/entity/fomo_menu.dart';
import 'package:flutter_app/service/home_service.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:flutter_app/utils/system.dart';
import 'package:flutter_app/widget/app_text_heading.dart';

Widget fomoMenu(BuildContext context) {
  List<FomoMenu> listMenu = getFomoMenus();
  final double itemWidth = (getScreenWidth(context) - 42) / 2;
  final double itemHeight = itemWidth + 65;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appTextHeading(context, "Đừng bỏ lỡ"),
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
  BuildContext context,
  List<FomoMenu> listMenu,
  int index,
) {
  FomoMenu ett = listMenu[index];
  return GestureDetector(
    onTap: dummyAction,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
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

void dummyAction() {
  print('dummyAction');
}
