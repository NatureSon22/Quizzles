import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../util/colors.dart';
import 'gradientbuttonborder.dart';
import 'gradienttext.dart';

void _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 70),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Lottie.asset(
                  'assets/lottie/error.json',
                  width: 200,
                ),
                const Positioned(
                  bottom: -20,
                  child: Column(
                    children: [
                      GradientText(text: 'invalid code!', textSize: 35),
                      Text(
                        'Please, try again',
                        style: TextStyle(
                            color: brightBlue,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ), 
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            BorderGradientButton(
              label: 'ok',
              handleOnPressed: () {
                Navigator.of(context).pop();
              },
              fontSize: 25,
              padding: 40,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    },
  );
}
