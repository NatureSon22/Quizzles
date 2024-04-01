import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/util/colors.dart';

import '../components/title.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GradientText(text: 'About', textSize: 22),
            SizedBox(
              width: 40,
            )
          ],
        ),
        leading: Center(
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const FaIcon(
                FontAwesomeIcons.angleLeft,
                color: brightBlue,
              )),
        ),
        shadowColor: appBarShadow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
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
                    height: 70,
                  ),
                  const Text(
                    'Welcome to Quizzles, the ultimate mobile learning companion!',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Dive into our specialized lessons and quizzes designed to expand your knowledge on a variety of topics. With fixed lessons and interactive quizzes, you'll embark on a journey of learning that's both engaging and rewarding. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const FeatureSec(
                    imgPath: 'assets/images/banner/banner1.png',
                    info:
                        'Delivers to students comprehensive and precise lessons, ensuring a swift grasp of their coursework.',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const FeatureSec(
                      imgPath: 'assets/images/banner/banner2.png',
                      info:
                          'Facilitates students\' learning via online platforms, aiding in the retention of lesson content.'),
                  const SizedBox(
                    height: 30,
                  ),
                  const FeatureSec(
                      imgPath: 'assets/images/banner/banner3.png',
                      info:
                          'Provides students with quizzes designed to evaluate their understanding and progress in learning.'),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "Whether you're a trivia enthusiast or seeking to boost your expertise, Quizzles is your go-to app for fun and educational content. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const GradientText(
                      text:
                          'Challenge yourself to unlock new levels of knowledge!',
                      textSize: 40),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class FeatureSec extends StatelessWidget {
  final String imgPath;
  final String info;

  const FeatureSec({super.key, required this.imgPath, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          border: const GradientBoxBorder(gradient: topBottomGradient)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            info,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
