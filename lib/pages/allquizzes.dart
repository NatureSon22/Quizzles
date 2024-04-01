import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_app/data/userprogress.dart';
import 'package:midterm_app/util/colors.dart';

import '../components/gradienttext.dart';

class QuizzList extends StatelessWidget {
  final String code;
  const QuizzList({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GradientText(text: 'Quizzes', textSize: 22),
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
        children: [
          Expanded(child: Consumer(builder: (context, ref, _) {
            final notifier = ref.watch(subjectListProvider.notifier);
            final quizzes = notifier.getAllQuizzesForSubject(code);

            return Padding(
              padding: const EdgeInsets.all(30),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    String? quizState;
                    Color primaryColor;
                    Color secondaryColor;
                    IconData? icon;

                    switch (quizzes[index]['score']) {
                      case 0:
                        quizState = quizzes[index]['available'] == true
                            ? 'Available'
                            : null;
                        primaryColor = quizState == 'Available'
                            ? deepBlue
                            : const Color(0xFFE1E1E1);
                        secondaryColor = quizState == 'Available'
                            ? const Color(0xFFE9EDFC)
                            : const Color(0xFFE1E1E1);
                        break;
                      case >= 3:
                        quizState = quizzes[index]['available'] == true
                            ? 'Passed'
                            : null;
                        primaryColor = quizState == 'Passed'
                            ? Colors.green
                            : const Color(0xFFE1E1E1);
                        secondaryColor = quizState == 'Passed'
                            ? const Color(0xFFEDFFE1)
                            : const Color(0xFFE1E1E1);
                        icon = quizState == 'Passed'
                            ? FontAwesomeIcons.solidCircleCheck
                            : null;
                        break;
                      default:
                        quizState = quizzes[index]['available'] == true
                            ? 'Failed'
                            : null;
                        primaryColor = quizState == 'Failed'
                            ? Colors.red
                            : const Color(0xFFE1E1E1);
                        secondaryColor = quizState == 'Failed'
                            ? const Color(0xFFFFE5E5)
                            : const Color.fromARGB(255, 146, 146, 146);
                        icon = quizState == 'Failed'
                            ? FontAwesomeIcons.solidCircleXmark
                            : null;
                        break;
                    }

                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 2)),
                      child: MaterialButton(
                        color: secondaryColor,
                        minWidth: double.infinity,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Quiz #${index + 1}',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor)),
                              Text(
                                quizState ?? '',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor),
                              ),
                              FaIcon(
                                icon,
                                color: primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: quizzes.length),
            );
          }))
        ],
      ),
    );
  }
}
