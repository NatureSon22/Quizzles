import 'dart:async';
import 'package:flutter/material.dart';
import 'package:midterm_app/pages/captcha_app/captcha.dart';
import 'package:midterm_app/pages/startingscreen.dart';
import 'package:midterm_app/util/colors.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        PageTransition(
            child: const StartingScreen(),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            type: PageTransitionType.fade),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var logo = Center(
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          left: 30,
          bottom: 50,
          child: Image.asset(
            "assets/images/element/whitebulb.png",
            width: 70,
          ),
        ),
        const Text(
          'Quizzles',
          style: TextStyle(fontFamily: 'SuezOne', color: white, fontSize: 60),
        ),
      ]),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: topBottomGradient),
        child: logo,
      ),
    );
  }
}
