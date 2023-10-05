import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peltar/view/tabs/activity.dart';
import 'package:peltar/view/tabs/dashboard.dart';
import 'package:peltar/view/tabs/profile.dart';
import 'package:peltar/view/tabs/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final int currentTab;
  const Home({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  static const String prefSelectedIndexKey = 'selectedIndex';
  static List<Widget> pages = <Widget>[
    const DashboardPage(),
    ActivityScreens(),
    const SettingScreens(),
    const Profile(),
  ];
  static var icons = [
    Icons.home_outlined,
    Icons.task,
    Icons.settings,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed('scan', params: {'tab': '0'});
        },
        child: const Icon(Icons.document_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        inactiveColor: Colors.grey,
        activeColor: const Color(0xFF00337C),
        backgroundColor: Colors.white,
        gapLocation: GapLocation.center,
        leftCornerRadius: 15,
        rightCornerRadius: 15,
        shadow: const BoxShadow(
          color: Colors.black,
          blurRadius: 2,
          spreadRadius: 3,
        ),
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
  }
}
