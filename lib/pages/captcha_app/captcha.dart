import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:midterm_app/components/gradientbutton.dart';
import 'package:midterm_app/components/gradientbuttonborder.dart';
import 'package:midterm_app/components/gradienttext.dart';
import 'package:midterm_app/components/title.dart';
import 'package:midterm_app/pages/captcha_app/word.dart';
import 'package:midterm_app/pages/dashboard.dart';
import 'package:midterm_app/util/colors.dart';

class CaptchaBody extends StatefulWidget {
  const CaptchaBody({super.key});

  @override
  State<CaptchaBody> createState() => _CaptchaBodyState();
}

class _CaptchaBodyState extends State<CaptchaBody> {
  String imageUrl = "";
  String captchaWord = "";
  TextEditingController textController = TextEditingController();
  bool click = false;

  void handleClickState() {
    setState(() {
      click = !click;
    });
  }

  void checkUserInput() {
    if (captchaWord.isEmpty) {
      _showSnackBar('Get a key first!');
      return;
    }

    if (textController.text.isEmpty) {
      _showSnackBar('Input code is required!');
      return;
    }

    bool isCorrect = captchaWord == textController.text;

    if (isCorrect) {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.custom,
      );

      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
        EasyLoading.dismiss();
      });
    } else {
      _showMyDialog();
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: deepBlue,
      duration: const Duration(seconds: 1),
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 70),
          content: Column(
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
                  textController.clear();
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

  Future<void> _getImageUrl() async {
    // EasyLoading.show(
    //   maskType: EasyLoadingMaskType.custom,
    // );
    handleClickState();

    while (true) {
      captchaWord = RandomWord.getRandomWord();

      try {
        final url =
            'https://captcha-generator.p.rapidapi.com/?text=$captchaWord&noise_number=10&fontname=sora';
        const apiKey = '089a375889msh9a6ad90ff7acc20p1e31e9jsn9fb3e9157935';
        const headers = {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'captcha-generator.p.rapidapi.com',
        };

        final response = await http.get(Uri.parse(url), headers: headers);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          setState(() {
            imageUrl = data['image_url'];
          });
          break;
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        textController.clear();
      }
    }
    handleClickState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Image.asset(
                    "assets/images/element/gradientbulb.png",
                    width: 100,
                  ),
                ),
                const GradientTitle(title: 'Quizzles', fontSize: 60),
              ]),
              const SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GradientText(text: 'Captcha Login', textSize: 25),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Please ensure to accurately input the captcha code to successfully log in to the application.',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 120,
                      decoration: BoxDecoration(
                        color: whiteGrey,
                        border: Border.all(color: midGrey),
                      ),
                      child: imageUrl.isNotEmpty
                          ? imageUrl.isEmpty
                              ? const SizedBox()
                              : Image.network(
                                  imageUrl,
                                  fit: BoxFit.fill,
                                )
                          : const Center(
                              child: Text(
                              'Generate captcha',
                              style: TextStyle(
                                  color: midGrey, fontFamily: 'Poppins'),
                            )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    CaptchaInput(
                      controller: textController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GradientButton(
                      label: 'Login',
                      handleOnTap: checkUserInput,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (click)
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          color: deepBlue,
                        ),
                      )
                    else
                      BorderGradientButton(
                        label: imageUrl.isEmpty
                            ? "Get key"
                            : "Generate another key",
                        handleOnPressed: _getImageUrl,
                        fontSize: 20,
                        padding: 0,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CaptchaInput extends StatelessWidget {
  final TextEditingController controller;

  const CaptchaInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GradientText(text: 'Enter code here', textSize: 20),
        Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            Container(
              height: 3.5,
              decoration: const BoxDecoration(gradient: leftBottomGradient),
            )
          ],
        ),
      ],
    );
  }
}
