import 'package:flutter/material.dart';

Widget appTextDivider(String text) {
  return Row(
    children: [
      Expanded(
          child: Container(
        height: 1,
        color: Colors.grey[400],
      )),
      Text('   $text   '),
      Expanded(
          child: Container(
        height: 1,
        color: Colors.grey[400],
      )),
    ],
  );
}
