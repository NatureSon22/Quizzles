import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:midterm_app/components/gradientbuttonborder.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/util/colors.dart';
import 'gradientbutton.dart';

void showCustomDialog(
    BuildContext context,
    String title,
    String subtitle,
    String animation,
    Function primary,
    String primaryText,
    Function secondary,
    String secondaryText,
    bool isOneFunction) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            shadowColor: midGrey,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              width: 500,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 90,
                      height: 90,
                      child: LottieBuilder.asset(
                        animation,
                        width: 90,
                        fit: BoxFit.fill,
                      )),
                  Center(child: GradientText(text: title, textSize: 35)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: brightBlue),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (isOneFunction)
                    GradientButton(
                      label: primaryText,
                      fontSize: 16,
                      handleOnTap: primary,
                    ),
                  if (!isOneFunction)
                    Row(
                      children: [
                        Flexible(
                          child: BorderGradientButton(
                            label: primaryText,
                            fontSize: 15,
                            handleOnPressed: primary,
                            padding: 0,
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Flexible(
                          child: GradientButton(
                              label: secondaryText, handleOnTap: secondary, fontSize: 15,),
                        )
                      ],
                    )
                ],
              ),
            ));
      });
}
