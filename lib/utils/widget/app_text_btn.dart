import 'package:flutter/material.dart';
import 'package:flutter_app/utils/color.dart';

Widget appTextButton({
  required String text,
  required VoidCallback action,
  double fontSize = 16,
}) {
  return TextButton(
    onPressed: action,
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textLink,
      ),
    ),
  );
}
