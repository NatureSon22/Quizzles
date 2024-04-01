import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:midterm_app/components/gradientbutton.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/data/subjectlessons.dart';
import 'package:midterm_app/pages/lessonquiz.dart';
import 'package:midterm_app/util/colors.dart';
import 'package:midterm_app/util/randompickquiz.dart';

class LessonInterface extends StatefulWidget {
  final String code;
  final int index;
  final String? filePath;
  const LessonInterface({Key? key, required this.code, required this.index, this.filePath = "lib/data/html/IT4lesson1.html"})
      : super(key: key);

  @override
  State<LessonInterface> createState() => _LessonInterfaceState();
}

class _LessonInterfaceState extends State<LessonInterface> {
  String htmlContent = "";

  void loadHtmlFromFile(String filePath) async {
    try {
      String content = await rootBundle.loadString(filePath);
      setState(() {
        htmlContent = content;
      });
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    loadHtmlFromFile(widget.filePath ?? "lib/data/html/IT4lesson1.html" );
    debugPrint(widget.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const FaIcon(
                    FontAwesomeIcons.angleLeft,
                    color: brightBlue,
                    size: 30,
                  ),
                ),
                GradientText(
                  text: 'Lesson ${widget.index + 1}',
                  textSize: 25,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: GradientText(
                              text: materials[widget.code]['lessons'][widget.index]['title'],
                              textSize: 24),
                        ),
                      ],
                    ),
                    HtmlWidget(htmlContent,
                      textStyle: const TextStyle(fontFamily: 'Poppins'),
                      customWidgetBuilder: (element) {
                        if (element.attributes['src']?.startsWith('asset:') ==
                            true) {
                          final assetPath = element.attributes['src']
                              ?.replaceFirst('asset:', '');
                          return Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  border: GradientBoxBorder(
                                      gradient: topBottomGradient, width: 1)),
                              child: Image.asset(
                                assetPath.toString(),
                                fit: BoxFit.cover,
                              ));
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: const BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: tabShadow,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: GradientButton(
              label: 'Take Quiz',
              handleOnTap: () {
                EasyLoading.show(
                  maskType: EasyLoadingMaskType.custom,
                );

                Future.delayed(const Duration(seconds: 3), () {
                  EasyLoading.dismiss();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LessonQuiz(
                                questions: getRandomQuizzes(
                                    materials[widget.code]?['lessons']?[widget.index]['quiz'],
                                    code: widget.code,
                                    index: widget.index),
                                code: widget.code,
                                index: widget.index,
                              )));
                });
              },
              padding: 40,
            ),
          )
        ],
      ),
    );
  }
}

// if (element.attributes.containsValue('definition')) {

//   var document = htmlParser.parse(element.innerHtml);
//   String textData = htmlParser
//       .parse(document.body!.text)
//       .documentElement!
//       .text;

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Container(
//         height: 50,
//         width: 10,
//         decoration: const BoxDecoration(
//           gradient: topBottomGradient,
//         ),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: Text(
//           textData,
//           textAlign: TextAlign.justify,
//           style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
//         ),
//       ),
//     ],
//   );
// }