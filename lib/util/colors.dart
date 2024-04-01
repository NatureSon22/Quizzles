import 'package:flutter/material.dart';

const deepBlue = Color(0xFF7002CD);
const deepBlueLight = Color.fromRGBO(112, 2, 205, 0.15);
const brightBlue = Color(0xFF01A5FE);
const whiteBlue = Color(0xFFAED2FF);
const iconColor = Color.fromARGB(255, 131, 11, 230);
const white = Color(0xFFFDFFFF);
const whiteGrey = Color.fromARGB(255, 225, 226, 226);
const darkGrey = Color(0xFF2C2C2C);
const black = Color(0xFF2C2C2C);
const lightGrey = Color.fromARGB(255, 184, 182, 182);
const midGrey = Color.fromARGB(255, 161, 161, 161);
const appBarShadow = Color.fromARGB(120, 231, 231, 231);
const tabShadow = Color.fromRGBO(221, 221, 221, 1);
const elevation = Color.fromRGBO(97, 97, 97, 0.5);

const LinearGradient topBottomGradient = LinearGradient(
    colors: [brightBlue, deepBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

const LinearGradient leftBottomGradient = LinearGradient(
  colors: [brightBlue, deepBlue],
);

const LinearGradient lightLeftBottomGradient = LinearGradient(
  colors: [Color.fromRGBO(1, 165, 254, 0.2), Color.fromRGBO(112, 2, 205, 0.2)],
);

const LinearGradient lightTopBottomGradient = LinearGradient(
  colors: [Color.fromRGBO(1, 165, 254, 0.1), Color.fromRGBO(112, 2, 205, 0.35)],
   begin: Alignment.topCenter,
    end: Alignment.bottomCenter
);
