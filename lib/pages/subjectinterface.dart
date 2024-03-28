import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/components/navbar.dart';
import 'package:midterm_app/data/subjectlessons.dart';
import 'package:midterm_app/util/colors.dart';

class SubjectInterface extends StatelessWidget {
  final String code;
  const SubjectInterface({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                gradient: leftBottomGradient,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(20)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  Image.asset(
                    'assets/images/element/SE.png',
                    width: 220,
                  ),
                  Positioned(
                    bottom: -50,
                    left: 20,
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: elevation,
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: Hero(
                        tag: code,
                        child: Image.asset(
                          'assets/images/element/IT4.png',
                          width: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration:
                            const BoxDecoration(gradient: topBottomGradient),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          materials['ITE4']['overview'],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 13),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GradientText(text: 'Lessons', textSize: 25),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all quizzes',
                        style: TextStyle(
                            color: deepBlue,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w900),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 200, child: LessonList()),
            const NavBar()
          ],
        ),
      ),
    );
  }
}

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: materials['ITE4']['lessons'].length,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, int index) {
        return Container(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
              gradient: lightLeftBottomGradient,
              border:
                  GradientBoxBorder(gradient: leftBottomGradient, width: 2)),
          child: MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Text(
              materials['ITE4']?['lessons']?[index]['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: deepBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }
}
