import 'package:flutter/material.dart';
import 'package:flutter_app/widget/app_text_heading.dart';
import 'package:flutter_app/widget/app_text_link.dart';

Widget topAd(BuildContext context) {
  Widget bannerText() {
    return Container(
      margin: EdgeInsets.only(right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appTextHeading(context, "Giảm tới 40% Trà vải tươi dầm Phúc Long"),
          Container(
            height: 36,
            child: appTextLink(text: "Nhận ngay", action: getNowAction),
          )
        ],
      ),
    );
  }

  return Container(
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: bannerText(),
        ),
        Image.asset(
          "assets/phuclong.png",
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
}

void getNowAction() {
  print('getNowAction');
}
