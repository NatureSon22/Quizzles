import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/pages/dashboard.dart';
import 'package:midterm_app/pages/subjectinterface.dart';
import 'package:midterm_app/util/colors.dart';

import '../components/gradientbuttonborder.dart';

class SummaryQuiz extends StatelessWidget {
  final List userQuiz;
  final int score;
  const SummaryQuiz({super.key, required this.userQuiz, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: const BoxDecoration(gradient: lightTopBottomGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  color: white,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 250,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/element/Group 12.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 200,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: 320,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: tabShadow,
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                        offset: Offset(0, 5))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoField(
                                        label:
                                            "${((score.toInt() / 5) * 100).toInt()}%",
                                        color: brightBlue,
                                        field: 'Completion',
                                      ),
                                      const SizedBox(height: 20),
                                      InfoField(
                                        label: score.toString(),
                                        color: const Color(0xFF1F8435),
                                        field: 'Correct',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const InfoField(
                                        label: "5",
                                        color: deepBlue,
                                        field: 'Total Question',
                                      ),
                                      const SizedBox(height: 20),
                                      InfoField(
                                        label: (5 - score).toString(),
                                        color: Colors.red,
                                        field: 'Wrong',
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.25),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.35),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                // Inner container with score text
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Your Score',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: brightBlue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      GradientText(
                                        text: '$score / 5',
                                        textSize: 35,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      const GradientText(text: 'Quiz Summary', textSize: 30),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(child: QuestionList(userQuiz: userQuiz))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Consumer(
              builder: (context, ref, child) {
                final notifier = ref.read(chosenSubjectLesson);

                return BorderGradientButton(
                  label: score < 3 ? "Retake Lesson " : "Start a new lesson!",
                  handleOnPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubjectInterface(code: notifier['code'] ?? '')));
                  },
                  fontSize: 20,
                  padding: 40);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionList extends StatelessWidget {
  const QuestionList({
    super.key,
    required this.userQuiz,
  });

  final List userQuiz;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userQuiz.length,
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(
                  color: tabShadow, width: 1, style: BorderStyle.solid),
            )),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Question ${index + 1}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: brightBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 13),
                      decoration: BoxDecoration(
                          color:
                              userQuiz[index].selectedOption.isCorrect == true
                                  ? const Color(0xFFEDFFE1)
                                  : const Color(0xFFFFE5E5),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Text('${userQuiz[index].selectedOption.text}',
                              style: TextStyle(
                                fontSize: 14.5,
                                color:
                                    userQuiz[index].selectedOption.isCorrect ==
                                            true
                                        ? Colors.green
                                        : Colors.red,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          if (userQuiz[index].selectedOption.isCorrect == false)
                            const FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              color: Colors.red,
                            ),
                          if (userQuiz[index].selectedOption.isCorrect == true)
                            const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                            )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  userQuiz[index].text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500),
                ),
                if (userQuiz[index].selectedOption.isCorrect == false)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'CORRECT ANSWER: ${userQuiz[index].options.where((option) => option.isCorrect == true).toList()[0].text}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w900),
                    ),
                  )
              ],
            ));
      },
    );
  }
}

class InfoField extends StatelessWidget {
  const InfoField(
      {super.key,
      required this.label,
      required this.color,
      required this.field});

  final String label;
  final Color color;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: color),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              field,
              style: const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            )
          ],
        )
      ],
    );
  }
}
