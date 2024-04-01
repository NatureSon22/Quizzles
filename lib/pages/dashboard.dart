import 'package:flutter/material.dart';
import 'package:midterm_app/components/navbar.dart';
import 'package:midterm_app/pages/settings.dart';
import 'package:midterm_app/pages/subjects.dart';
import 'package:midterm_app/util/colors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedTab = 0;

  void handleSelectedTab(value) {
    setState(() {
      selectedTab = value;
      debugPrint(selectedTab.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          selectedTab == 0 ? 'My subjects' : 'Settings',
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: black),
        ),
        shadowColor: appBarShadow,
      ),
      body: Column(
        children: [
          Expanded(
              child: selectedTab == 0 ? const Subjects() : const Settings()),
          NavBar(
            handleSelectedTab: handleSelectedTab,
          )
        ],
      ),
    );
  }
}
