import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Lesson {
  final String title;
  bool available;
  double quizScore;

  Lesson({
    required this.title,
    this.available = false,
    this.quizScore = 0.0,
  });

  factory Lesson.withDefaults(String subCode, String title,
      {bool available = false}) {
    return Lesson(
      title: title,
      available: available,
      quizScore: 0.0,
    );
  }
}


class Subject {
  final String title;
  final List<Lesson> lessons;

  Subject({required this.title, required this.lessons});
}

// Define a StateNotifier to manage the subject list
class SubjectListNotifier extends StateNotifier<List<Subject>> {
  SubjectListNotifier(List<Subject> list) : super(list);

  void updateNextLesson(String subjectTitle, String lessonTitle, double score) {
    final subjectIndex =
        state.indexWhere((subject) => subject.title == subjectTitle);
    if (subjectIndex != -1) {
      final lessonIndex = state[subjectIndex]
          .lessons
          .indexWhere((lesson) => lesson.title == lessonTitle);
      if (lessonIndex != -1 &&
          lessonIndex + 1 < state[subjectIndex].lessons.length) {
        state[subjectIndex].lessons[lessonIndex].quizScore = score;
        if (score >= 3) {
          state[subjectIndex].lessons[lessonIndex + 1].available = true;
        }
        state = [...state];
      }
    }
  }

  Subject? getSubjectByTitle(String title) {
    return state.firstWhere((subject) => subject.title == title);
  }

  Lesson? getLessonByTitle(String subjectTitle, String lessonTitle) {
    final subject =
        state.firstWhere((subject) => subject.title == subjectTitle);
    return subject.lessons.firstWhere((lesson) => lesson.title == lessonTitle);
  }

  List<Map<String, dynamic>> getAllQuizzesForSubject(String subjectTitle) {
    final subject = state.firstWhere((subject) => subject.title == subjectTitle,
        orElse: () => Subject(title: '', lessons: []));
    return subject.lessons
        .map((lesson) =>
            {"score": lesson.quizScore, "available": lesson.available})
        .toList();
  }
}

final subjectListProvider =
    StateNotifierProvider<SubjectListNotifier, List<Subject>>((ref) {
  return SubjectListNotifier([
    Subject(title: 'IT4', lessons: [
      Lesson(title: 'What is Software Engineering', available: true),
      Lesson(title: 'Agile Software Development'),
      Lesson(title: 'Architectural Design and Modelling')
    ]),
    Subject(title: 'ITE7', lessons: [
      Lesson(
          title: 'Emerging Technology and Its Characteristics',
          available: true),
      Lesson(title: 'Emerging Technology Areas', available: true),
      Lesson(title: 'Flutter Development')
    ]),
    Subject(title: 'IT7', lessons: [
      Lesson(title: 'Decision Making and Problem Solving', available: true),
      Lesson(title: 'Machine Learning'),
      Lesson(title: 'Database Warehousing')
    ]),
  ]);
});
