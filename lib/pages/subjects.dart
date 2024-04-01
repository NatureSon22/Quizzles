import 'package:flutter/material.dart';

import '../components/subjecttab.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          crossAxisCount: 2,
          children: const [
            SubjectTab(
              imagePath: 'assets/images/element/IT4.png',
              subjectTitle: 'IT4 (SE)',
              code: 'IT4',
            ),
            SubjectTab(
              imagePath: 'assets/images/element/ITE7.png',
              subjectTitle: 'ITE7 (ADE)',
              code: 'ITE7',
            ),
            SubjectTab(
              imagePath: 'assets/images/element/IT7.png',
              subjectTitle: 'IT7 (ITF)',
              code: 'IT7',
            )
          ]),
    );
  }
}
