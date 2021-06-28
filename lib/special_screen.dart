import 'package:flutter/material.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:flutter_app/widget/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpecialScreeen extends StatefulWidget {
  const SpecialScreeen({Key? key}) : super(key: key);

  @override
  _SpecialScreeenState createState() => _SpecialScreeenState();
}

class _SpecialScreeenState extends State<SpecialScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Đặc quyền"),
      body: Center(
        child: FaIcon(
          FontAwesomeIcons.chessQueen,
          size: 100,
          color: colorTabSelected,
        ),
      ),
    );
  }
}
