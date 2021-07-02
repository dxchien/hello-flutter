import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home/home_screen.dart';
import 'package:flutter_app/screen/inbox_screen.dart';
import 'package:flutter_app/screen/profile_screen.dart';
import 'package:flutter_app/screen/scan_screen.dart';
import 'package:flutter_app/screen/special_screen.dart';
import 'package:flutter_app/service/home_service.dart';
import 'package:flutter_app/utils/color.dart';

class StackScreen extends StatefulWidget {
  @override
  _StackScreenState createState() => new _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  int pageIndex = 0;
  late PageController pageController;

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
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedFontSize: 12,
        selectedItemColor: colorTabSelected,
        type: BottomNavigationBarType.fixed,
        currentIndex: this.pageIndex,
        items: getBottomMenus(),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 52),
        child: Container(
          height: 40,
          width: 40,
          child: Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this.pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
  }
}
