import 'package:flutter/material.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:flutter_app/widget/app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: "Ví VinID"),
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
