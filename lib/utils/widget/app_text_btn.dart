import 'package:flutter/material.dart';

Widget appTextButton({required String text, required VoidCallback action}) {
  return Center(
    child: TextButton(
      onPressed: action,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFFFE724C),
        ),
      ),
    ),
  );
}
