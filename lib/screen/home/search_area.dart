import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/color.dart';

import 'gift_dialog.dart';

Widget searchArea(BuildContext context) {
  Widget giftButton() {
    return Container(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          giftButtonAction(context);
        },
        child: Icon(
          Icons.card_giftcard,
          color: colorGrey,
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(
            side: BorderSide(color: colorBorder),
          ),
          padding: EdgeInsets.all(0),
          primary: Colors.white,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: colorBorder),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          const SizedBox(width: 16),
          AnimatedTextKit(
            pause: Duration(milliseconds: 300),
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText('Bạn đang muốn tìm...'),
              RotateAnimatedText('Nạp điểm'),
              RotateAnimatedText('Ưu đãi, giảm giá'),
              RotateAnimatedText('Phúc Long, Tocotoco'),
            ],
          ),
        ],
      ),
    );
  }

  return Container(
    color: Colors.transparent,
    child: Row(
      children: [
        Expanded(
          child: searchBox(),
        ),
        SizedBox(width: 6),
        giftButton(),
      ],
    ),
  );
}

void giftButtonAction(BuildContext context) {
  showGifDialog(
    context: context,
    message: 'Nhập email hoặc số điện thoại',
    onConfirm: (data) {
      print(data);
    },
  );
}