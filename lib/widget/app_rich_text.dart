import 'package:flutter/material.dart';

Widget appRichText({
  String? text,
  required String link,
  required VoidCallback action,
}) {
  return GestureDetector(
    onTap: action,
    child: Center(
      child: RichText(
        text: TextSpan(children: [
          if (text != null) ...[
            TextSpan(
              text: text,
              style: TextStyle(color: Color(0xFF5B5B5E)),
            ),
          ],
          TextSpan(text: link, style: TextStyle(color: Color(0xFFFE724C))),
        ]),
      ),
    ),
  );
}
