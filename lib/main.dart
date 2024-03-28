import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:midterm_app/data/subjectlessons.dart';
import 'package:midterm_app/pages/captcha_app/captcha.dart';
import 'package:midterm_app/pages/dashboard.dart';
import 'package:midterm_app/pages/quizinterface.dart';
import 'package:midterm_app/pages/splashscreen.dart';
import 'package:midterm_app/pages/startingscreen.dart';
import 'package:midterm_app/pages/subjectinterface.dart';
import 'package:midterm_app/util/colors.dart';

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
      home: SafeArea(child: Quiz(questions: materials['ITE4']?['lessons']?[0]['quiz'],)),
      builder: EasyLoading.init(),
    );
  }
}
