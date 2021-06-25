import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

Widget appTextField({
  TextEditingController? controller,
  required TextInputType keyboardType,
  bool obscureText = false,
  String? hintText,
  IconData? suffixIcon,
  VoidCallback? onTapSuffixIcon,
}) {
  return Container(
    height: 64,
    child: TextField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      inputFormatters: [LengthLimitingTextInputFormatter(100)],
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: mainPurple),
        ),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  if (onTapSuffixIcon != null) {
                    onTapSuffixIcon();
                  }
                },
                child: Icon(suffixIcon),
              )
            : null,
      ),
    ),
  );
}
