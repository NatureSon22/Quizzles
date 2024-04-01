import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:midterm_app/components/customdialog.dart';
import 'package:midterm_app/components/gradientbuttonborder.dart';
import 'package:midterm_app/data/userprogress.dart';
import 'package:midterm_app/pages/dashboard.dart';
import 'package:midterm_app/pages/quizsummary.dart';
import 'package:midterm_app/pages/subjectinterface.dart';
import 'package:midterm_app/util/colors.dart';
import 'package:midterm_app/util/quizmodel.dart';

class LessonQuiz extends StatefulWidget {
  final List questions;
  final String code;
  final int index;
  const LessonQuiz(
      {super.key,
      required this.questions,
      required this.code,
      required this.index});

  @override
  State<LessonQuiz> createState() => _LessonQuizState();
}

class _LessonQuizState extends State<LessonQuiz> {
  late String code;

  late Timer _timer;
  Duration _duration = const Duration(minutes: 5);
  int counter = 0;
  PageController controller = PageController(initialPage: 0);
  List<Question> userActivity = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration = _duration - const Duration(seconds: 1);
        } else {
          _timer.cancel();
          showCustomDialog(
              context,
              'Quiz Time Over',
              'Submit answer and see score',
              'assets/lottie/bell.json',
              () => viewSummary(),
              'See Results',
              () {},
              '',
              true);
        }
      });
    });
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: deepBlue,
      duration: const Duration(seconds: 1),
      content: Text(
        message,
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void handleOnPressed(Question question, Function updateScore) {
    if (widget.questions[counter].selectedOption == null) {
      _showSnackBar('Please select an option!');
      return;
    }

    score = question.selectedOption?.isCorrect == true ? score + 1 : score;
    userActivity.add(question);

    if (counter != widget.questions.length - 1) {
      setState(() {
        counter++;
      });
      controller.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    } else {
      // here
      updateScore();
      final title = score < 3 ? 'Failed the Quiz!' : 'Passed the Quiz!';
      final message =
          score < 3 ? 'Try harder next time!' : 'Up for the next lesson?';
      final lottie =
          score < 3 ? 'assets/lottie/error.json' : 'assets/lottie/passed.json';
      final onPress = score < 3 ? reStart : nextLesson;
      final buttonText = score < 3 ? 'Retake' : 'Next Lesson';

      showCustomDialog(context, title, message, lottie, viewSummary,
          'See Results', onPress, buttonText, false);
    }
  }

  void nextLesson() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SubjectInterface(code: code,)));
  }

  void reStart() {
    Navigator.pop(context);
    setState(() {
      counter = 0;
    });
    _duration = const Duration(minutes: 5);
    score = 0;
    userActivity.clear();
    controller.jumpToPage(0);
  }

  void viewSummary() {
    _timer.cancel();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SummaryQuiz(userQuiz: userActivity, score: score)));
  }

  void exitQuiz() {
    _timer.cancel();
    showCustomDialog(
        context,
        'Do you really want to exit?',
        'Progress will not be saved',
        'assets/lottie/info.json',
        () {
          Navigator.pop(context);
          _startTimer();
        },
        'Cancel',
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubjectInterface(code: code)));
        },
        'OK',
        false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => exitQuiz(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: deepBlue,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: const BoxDecoration(gradient: lightTopBottomGradient),
        child: Consumer(
          builder: (context, ref, child) {
            final sub = ref.read(chosenSubjectLesson);
            code = sub['code']!;
            final lesson = sub['lesson'];

            void updateScore() {
              final notifier = ref.watch(subjectListProvider.notifier);
              notifier.updateNextLesson(code, lesson!, score.toDouble());
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
                  '${(_duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                      fontSize: 25,
                      color: deepBlue,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                                height: 180,
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
                                top: 130,
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
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearProgressIndicator(
                                        value: ((counter + 1)) / 5,
                                        backgroundColor: appBarShadow,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        widget.questions[counter].text,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: white, shape: BoxShape.circle),
                                    child: Image.asset(
                                        'assets/images/element/gradientbulb.png',
                                        width: 80)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 130,
                          ),
                          MainQuiz(
                              questions: widget.questions,
                              controller: controller)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                BorderGradientButton(
                    label: counter != widget.questions.length - 1
                        ? 'Next Question'
                        : 'Submit',
                    handleOnPressed: () =>
                        handleOnPressed(widget.questions[counter], updateScore),
                    fontSize: 20,
                    padding: 40),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MainQuiz extends StatefulWidget {
  final List questions;
  final PageController controller;
  const MainQuiz(
      {super.key, required this.questions, required this.controller});

  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView.builder(
            controller: widget.controller,
            itemCount: widget.questions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final question = widget.questions[index];
              return buildQuestion(question);
            }));
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: OptionsWidget(
          question: question,
          onClickedOption: (option) {
            setState(() {
              question.selectedOption = option;
            });
          },
        )),
      ],
    );
  }
}

class OptionsWidget extends StatefulWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  Option? prevSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.question.options
          .map((option) => buildOption(context, option))
          .toList(),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: prevSelected != null
              ? option == widget.question.selectedOption
                  ? leftBottomGradient
                  : null
              : null,
          border: const GradientBoxBorder(gradient: leftBottomGradient)),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        highlightColor: Colors.transparent,
        onPressed: () {
          setState(() {
            prevSelected = option;
            widget.onClickedOption(option);
          });
        },
        child: Text(option.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins',
              color: prevSelected != null
                  ? option == widget.question.selectedOption
                      ? white
                      : black
                  : black,
            )),
      ),
    );
  }
}
