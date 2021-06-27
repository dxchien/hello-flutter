import 'package:flutter/material.dart';
import 'package:flutter_app/utils/color.dart';

Widget appTextLink({
  required String text,
  required VoidCallback action,
  double fontSize = 16,
}) {
  return TextButton(
    onPressed: action,
    style: TextButton.styleFrom(padding: EdgeInsets.zero),
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textButton,
      ),
    ),
  );
}
