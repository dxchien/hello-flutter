import 'package:flutter/material.dart';
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/inbox_screen.dart';
import 'package:flutter_app/profile_screen.dart';
import 'package:flutter_app/scan_screen.dart';
import 'package:flutter_app/special_screen.dart';
import 'package:flutter_app/utils/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StackScreen extends StatefulWidget {
  @override
  _StackScreenState createState() => new _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    HomeScreen(),
    SpecialScreeen(),
    ScanScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedFontSize: 12,
        selectedItemColor: colorTabSelected,
        type: BottomNavigationBarType.fixed,
        currentIndex: this._pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chessQueen, size: 20),
            label: "Đặc quyền",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/ic_function_scanner.png",
              width: 44,
              height: 44,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Hòm thư",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: "Tài khoản",
          ),
        ],
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
  }
}
