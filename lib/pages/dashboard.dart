import 'package:flutter/material.dart';
import 'package:midterm_app/components/navbar.dart';
import 'package:midterm_app/components/subjecttab.dart';
import 'package:midterm_app/util/colors.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'My subjects',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: black),
        ),
        shadowColor: appBarShadow,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
                        code: 'IT4',),
                    SubjectTab(
                        imagePath: 'assets/images/element/ITE7.png',
                        subjectTitle: 'ITE7 (ADE)',
                        code: 'ITE7',),
                    SubjectTab(
                        imagePath: 'assets/images/element/IT7.png',
                        subjectTitle: 'IT7 (ITF)',
                        code: 'IT7',)
                  ]),
            ),
          ),
          const NavBar()
        ],
      ),
    );
  }
}
