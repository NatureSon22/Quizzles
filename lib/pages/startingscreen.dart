import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:midterm_app/components/gradientbutton.dart';
import 'package:midterm_app/components/title.dart';
import 'package:midterm_app/pages/captcha_app/captcha.dart';
import 'package:midterm_app/util/colors.dart';
import 'package:page_transition/page_transition.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(clipBehavior: Clip.none, children: [
            Positioned(
              left: 15,
              bottom: 40,
              child: Image.asset(
                "assets/images/element/gradientbulb.png",
                width: 100,
              ),
            ),
            const GradientTitle(title: 'Quizzles', fontSize: 60),
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        ContentSlideshow(
            height: 400,
            width: double.infinity,
            indicatorColor: brightBlue,
            indicatorBackgroundColor: lightGrey,
            children: [
              Image.asset(
                'assets/images/element/banner1.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/element/banner2.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/element/banner3.png',
                fit: BoxFit.cover,
              )
            ]),
        const SizedBox(
          height: 20,
        ),
        ContentSlideshow(height: 100, width: double.infinity, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: const Text(
                'Delivers to students comprehensive and precise lessons, ensuring a swift grasp of their coursework.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: const Text(
                'Facilitates students\' learning via online platforms, aiding in the retention of lesson content.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: const Text(
                  'Provides students with quizzes designed to evaluate their understanding and progress in learning.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins')))
        ]),
        const SizedBox(
          height: 20,
        ),
        GradientButton(
          label: 'Get Started',
          handleOnTap: () => Navigator.push(
              context,
              PageTransition(
                  child: const CaptchaBody(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn
                  )),
          padding: 40,
        )
      ],
    ));
  }
}

class ContentSlideshow extends StatelessWidget {
  final double height;
  final Duration autoPlayInterval;
  final bool isLoop;
  final Color indicatorColor;
  final Color indicatorBackgroundColor;
  final List<Widget> children;

  const ContentSlideshow({
    super.key,
    required this.height,
    this.autoPlayInterval = const Duration(milliseconds: 4000),
    this.isLoop = true,
    this.indicatorColor = Colors.white,
    this.indicatorBackgroundColor = Colors.white,
    required this.children,
    required double width,
  });

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: height,
      autoPlayInterval: 3000,
      isLoop: true,
      indicatorColor: indicatorColor,
      indicatorRadius: 4,
      indicatorPadding: 7,
      indicatorBackgroundColor: indicatorBackgroundColor,
      children: [...children],
    );
  }
}
