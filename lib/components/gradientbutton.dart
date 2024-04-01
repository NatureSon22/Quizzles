import 'package:flutter/material.dart';
import 'package:midterm_app/util/colors.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final Function handleOnTap;
  final double padding;
  final bool putIcon;
  final double fontSize;

  const GradientButton(
      {Key? key,
      required this.label,
      required this.handleOnTap,
      this.padding = 0,
      this.putIcon = false,
      this.fontSize = 20
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding == 0 ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: padding),
      onPressed: () => handleOnTap(),
      child: Ink(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: leftBottomGradient,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: putIcon
              ? const Icon(
                  Icons.play_arrow_sharp,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 40,
                )
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
        ),
      ),
    );
  }
}
