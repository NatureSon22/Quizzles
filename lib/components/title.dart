import 'package:flutter/material.dart';
import 'package:midterm_app/util/colors.dart';

class GradientTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const GradientTitle({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => leftBottomGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        child: Text(
          title,
          style: TextStyle(fontFamily: 'SuezOne', fontSize: fontSize),
        ));
  }
}
