import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midterm_app/util/quizmodel.dart';

class Quiz extends StatefulWidget {
  final List questions;
  const Quiz({super.key, required this.questions});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Timer _timer;
  Duration _duration = const Duration(minutes: 5);
  double counter = 2;

  @override
  void initState() {
    super.initState();
    _startTimer();
    debugPrint(widget.questions.toString());
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
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          title: Text(
            '${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
            '${(_duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 32),
          ),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              minHeight: 10.0,
              value: counter,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
            ),
            MainQuiz(questions: widget.questions),
          ],
        ));
  }
}

class MainQuiz extends StatefulWidget {
  final List questions;
  const MainQuiz({super.key, required this.questions});

  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView.builder(
            itemCount: widget.questions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) {
              final question = widget.questions[index];
              return buildQuestion(question);
            } ));
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32,),
        Text(
          question.text,
          style: const TextStyle(fontSize: 30)
        ),
        const SizedBox(height: 30,),
        Expanded(child: OptionsWidget( question: question, ))
      ],
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;

  const OptionsWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options.map((option) => buildOption(context, option)).toList(),
    );
  }
  
  Widget buildOption(BuildContext context, Option option) {
    reu
  }
}