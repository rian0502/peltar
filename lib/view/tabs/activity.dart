import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityScreens extends StatefulWidget {
  const ActivityScreens({Key? key}) : super(key: key);

  @override
  State<ActivityScreens> createState() => _ActivityScreensState();
}

class _ActivityScreensState extends State<ActivityScreens> {
  String? role;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        role = value.getString('role');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(role ?? 'kosong'),
    );
  }
}
