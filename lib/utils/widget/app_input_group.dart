import 'package:flutter/material.dart';

Widget appInputGroup({String? label, required Widget widget}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Full name",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9796A1)),
      ),
      const SizedBox(
        height: 12,
      ),
      widget,
    ],
  );
}
