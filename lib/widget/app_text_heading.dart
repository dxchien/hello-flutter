import 'package:flutter/material.dart';

Widget appTextHeading(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headline6,
  );
}
