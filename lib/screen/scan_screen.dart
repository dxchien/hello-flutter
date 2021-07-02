import 'package:flutter/material.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:flutter_app/widget/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "Scan",
        isBack: false,
      ),
      body: Center(
        child: FaIcon(
          FontAwesomeIcons.barcode,
          size: 100,
          color: colorTabSelected,
        ),
      ),
    );
  }
}
