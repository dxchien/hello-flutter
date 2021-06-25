import 'package:flutter/material.dart';

Widget appButton({
  required String text,
  int textColor = 0xFFFFFFFF,
  required VoidCallback action,
  String? prefixImage,
  int color = 0xFFFE724C,
}) {
  return Center(
    child: Container(
      width: 248,
      height: 60,
      child: ElevatedButton(
        onPressed: action,
        child: Row(
          crossAxisAlignment: prefixImage != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixImage != null) ...[
              Image.asset(
                prefixImage,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(textColor), fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ] else ...[
              Text(
                text,
                style: TextStyle(
                    color: Color(textColor), fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(color)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          shadowColor: MaterialStateProperty.all<Color>(Color(color)),
          elevation: MaterialStateProperty.all(5),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
        ),
      ),
    ),
  );
}
