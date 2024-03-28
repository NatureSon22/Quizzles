import 'package:flutter/material.dart';
import 'package:midterm_app/pages/subjectinterface.dart';
import 'package:midterm_app/util/colors.dart';

class SubjectTab extends StatelessWidget {
  final String imagePath;
  final String subjectTitle;
  final String code;
  const SubjectTab(
      {super.key, required this.imagePath, required this.subjectTitle, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color: tabShadow,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 2))
          ]),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubjectInterface(code: code)));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 90,
                  child: Hero(
                    tag: code,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                subjectTitle,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
