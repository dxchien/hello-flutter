import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        body: Stack(
          children: [
            topDecor(),
            buildBody(),
          ],
        ),
      ),
    );
  }
}

Widget buildBody() {
  return SafeArea(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            searchArea(),
            SizedBox(height: 20),
            topAd(),
          ],
        ),
      ),
    ),
  );
}

Widget topAd() {
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
                Text(
                  "Giảm tới 40% Trà vải tươi dầm Phúc Long",
                  style: TextStyle(
                    fontSize: 22,
                    color: greyText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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

Widget searchArea() {
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
              prefixIcon: Icon(Icons.search, color: greyText),
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
              color: greyText,
            ),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(color: inputBorder),
                ),
                padding: EdgeInsets.all(0),
                primary: Colors.white,
                shadowColor: Colors.transparent),
          ),
        )
      ],
    ),
  );
}

void giftButtonAction() {
  print('giftButtonAction');
}

void getNowAction() {
  print('getNowAction');
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
