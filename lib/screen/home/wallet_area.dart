import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home/home_screen.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:flutter_app/utils/formatter.dart';
import 'package:flutter_app/utils/navigator.dart';
import 'package:flutter_app/widget/show_value_bottom_sheet.dart';

import '../wallet_screen.dart';

Widget walletArea(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: wallet(
          context: context,
          prefixIcon: Icons.verified,
          suffixIcon: Icons.chevron_right,
          title: "Điểm tích luỹ",
          balance: formatInt(5300),
          mainAction: walletAction,
          extraAction: walletAction,
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: wallet(
          context: context,
          suffixIcon: Icons.add,
          prefixIcon: Icons.account_balance_wallet,
          title: "Ví của tôi",
          balance: formatCurrency(0),
          mainAction: walletAction,
          extraAction: depositAction,
        ),
      )
    ],
  );
}

Widget wallet({
  required IconData prefixIcon,
  required IconData suffixIcon,
  required String title,
  required String balance,
  required BuildContext context,
  required MyCallBack mainAction,
  required MyCallBack extraAction,
}) {
  Widget walletText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: TextStyle(color: colorHint),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            balance,
            style: TextStyle(color: colorGrey, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  return GestureDetector(
    onTap: () {
      mainAction(context);
    },
    child: Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(color: colorBorder),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Icon(prefixIcon, color: colorLink)),
          Expanded(
            child: walletText(),
          ),
          GestureDetector(
            onTap: () {
              extraAction(context);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
                height: double.infinity,
                padding: EdgeInsets.all(2),
                child: Icon(suffixIcon, color: colorLink)),
          ),
        ],
      ),
    ),
  );
}

void accumulatedPointsAction() {
  print('accumulatedPointsAction');
}

void walletAction(BuildContext context) {
  navigatorPush(context, WalletScreen());
}

void depositAction(BuildContext context) {
  final values = [
    '1.000.000đ',
    '2.000.000đ',
    '3.000.000đ',
    '4.000.000đ',
    '5.000.000đ',
  ];
  showValueBottomSheet(
    context: context,
    title: 'Nạp tiền',
    values: values,
    onSelected: (index, value) {
      print('$value');
    },
  );
}