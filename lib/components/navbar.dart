import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:midterm_app/util/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(221, 221, 221, 0.7),
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: GNav(
            haptic: true,
            tabBorderRadius: 30,
            tabActiveBorder: Border.all(color: Colors.transparent),
            tabBorder: Border.all(color: Colors.transparent),
            tabShadow: const [],
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            gap: 10,
            color: midGrey,
            activeColor: deepBlue,
            iconSize: 25,
            tabBackgroundColor: deepBlueLight,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: const TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: deepBlue),
            tabs: const [
              GButton(
                icon: Icons.menu_book_outlined,
                text: 'Subjects',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ]));
  }
}
