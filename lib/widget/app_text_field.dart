import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/color.dart';


Widget appTextField({
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  String? hintText,
  IconData? suffixIcon,
  VoidCallback? onTapSuffixIcon,
}) {
  return Container(
    height: 48,
    child: TextField(
      controller: controller,
      autocorrect: false,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      inputFormatters: [LengthLimitingTextInputFormatter(100)],
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorder),
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
