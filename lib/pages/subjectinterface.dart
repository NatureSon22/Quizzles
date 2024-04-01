import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/data/subjectlessons.dart';
import 'package:midterm_app/data/userprogress.dart';
import 'package:midterm_app/pages/allquizzes.dart';
import 'package:midterm_app/pages/lessoninterface.dart';
import 'package:midterm_app/util/colors.dart';
import 'package:page_transition/page_transition.dart';

final chosenSubjectLesson = StateProvider((ref) => {'code': '', 'lesson': ''});

class SubjectInterface extends StatelessWidget {
  final String code;
  const SubjectInterface({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                gradient: leftBottomGradient,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  Image.asset(
                    'assets/images/element/SE.png',
                    width: 220,
                  ),
                  Positioned(
                    bottom: -50,
                    left: 20,
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: elevation,
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: Hero(
                        tag: code,
                        child: Image.asset(
                          'assets/images/element/$code.png',
                          width: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration:
                            const BoxDecoration(gradient: topBottomGradient),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          materials[code]['overview'],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 13),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
            Container(
              height: 2,
              color: tabShadow,
              margin: const EdgeInsets.all(20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GradientText(text: 'Lessons', textSize: 25),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzList(code: code)));
                      },
                      child: const Text(
                        'See all quizzes',
                        style: TextStyle(
                            color: deepBlue,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w900),
                      ))
                ],
              ),
            ),
            SizedBox(
                height: 200,
                child: Consumer(
                  builder: (context, ref, _) {
                    return LessonList(code: code, ref: ref);
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 90,
              decoration: const BoxDecoration(
                  gradient: leftBottomGradient,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
            )
          ],
        ),
      ),
    );
  }
}

class LessonList extends StatefulWidget {
  final String code;
  final dynamic ref;

  const LessonList({
    super.key,
    required this.code,
    required this.ref,
  });

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  late List<Lesson> subjectLessons;

  @override
  void initState() {
    super.initState();
    try {
      final notifier = widget.ref.watch(subjectListProvider.notifier);
      subjectLessons = notifier.getSubjectByTitle(widget.code).lessons;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    void handleOnPress(int index, String lessonTitle) {
      widget.ref
          .read(chosenSubjectLesson.notifier)
          .update((state) => {'code': widget.code, 'lesson': lessonTitle});

      Navigator.push(
          context,
          PageTransition(
              child: LessonInterface(
                code: widget.code,
                index: index,
                filePath: materials[widget.code]['lessons'][index]['content'],
              ),
              type: PageTransitionType.bottomToTop,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutBack));
    }

    return ListView.separated(
      itemCount: materials[widget.code]['lessons'] != null
          ? materials[widget.code]['lessons'].length
          : 0,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, int index) {
        return Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              gradient: subjectLessons[index].available
                  ? lightLeftBottomGradient
                  : null,
              border: subjectLessons[index].available
                  ? const GradientBoxBorder(
                      gradient: leftBottomGradient, width: 2)
                  : Border.all(color: tabShadow, width: 2)),
          child: MaterialButton(
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            onPressed: () => subjectLessons[index].available
                ? handleOnPress(
                    index, materials[widget.code]?['lessons']?[index]['title'])
                : {},
            child: Text(
              materials[widget.code]?['lessons']?[index]['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: subjectLessons[index].available ? deepBlue : elevation,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }
}
