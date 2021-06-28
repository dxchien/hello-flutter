import 'package:flutter/material.dart';
import 'package:flutter_app/stack_screen.dart';
import 'package:flutter_app/utils/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: colorGrey,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: colorGrey,
              displayColor: colorGrey,
            ),
      ),
      home: StackScreen(),
    );
  }
}
