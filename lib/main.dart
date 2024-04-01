import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midterm_app/pages/dashboard.dart';
import 'package:midterm_app/pages/quizsummary.dart';
import 'package:midterm_app/pages/splashscreen.dart';
import 'package:midterm_app/util/colors.dart';
import 'package:midterm_app/util/quizmodel.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.foldingCube
    ..indicatorSize = 50.0
    ..radius = 10.0
    ..contentPadding = const EdgeInsets.all(40)
    ..progressColor = white
    ..backgroundColor = brightBlue
    ..indicatorColor = white
    ..textColor = white
    ..maskColor = const Color.fromARGB(255, 30, 19, 39).withOpacity(0.7)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzies',
      home: const SafeArea(
        child: DashBoard(),
      ),
      builder: EasyLoading.init(),
    );
  }
}

// LessonQuiz(questions: getRandomQuizzes(materials['ITE4']?['lessons']?[0]['quiz'],))
List<Question> userAct = [
  Question(
      text:
          'The system is developed as a series of versions or increments withstakeholders involved in version specification and evaluation',
      selectedOption: const Option(text: 'Agile Methods'),
      options: [
        const Option(text: 'Agile Methods'),
        const Option(text: 'Agile Development', isCorrect: true),
        const Option(text: 'Rapid Software Development'),
        const Option(text: 'Test-First Development')
      ]),
  Question(
      text:
          'Agile Methods the system is developed as a series of versionsor increments with stakeholders involved in version specification and evaluation',
      selectedOption: const Option(text: 'True'),
      options: [
        const Option(text: 'True'),
        const Option(text: 'False', isCorrect: true),
      ]),
  Question(
      text:
          'Testing is central to XP and XP has developed an approach wheretheprogram is tested after ever change has been made',
      selectedOption:
          const Option(text: 'Test-First Development', isCorrect: true),
      options: [
        const Option(text: 'Quality Assurcance Testing'),
        const Option(text: 'XP Testing'),
        const Option(text: 'Test-First Development', isCorrect: true),
        const Option(text: 'Customer Involvement')
      ]),
  Question(
      text:
          'Conventional wisdom in software engineering is to design for change',
      selectedOption: const Option(text: 'Extreme Programming'),
      options: [
        const Option(text: 'Extreme Programming'),
        const Option(text: 'Plan Development'),
        const Option(text: 'Refactoring', isCorrect: true),
        const Option(text: 'Agile Development')
      ]),
  Question(
      text:
          'Extreme Programming is a very influential agile method, developedinthelate 1990s, that introduced a range of agile development techniques',
      selectedOption: const Option(text: 'False'),
      options: [
        const Option(text: 'True', isCorrect: true),
        const Option(text: 'False'),
      ]),
];
