import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle textTitle = TextStyle(
      fontFamily: 'TT Smalls',
      fontSize: 32,
      height: 4,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w800);

  static const TextStyle textHeading = TextStyle(
      fontFamily: 'TT Smalls',
      fontSize: 20,
      height: 2.4,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w800);

  static const TextStyle textBold = TextStyle(
      fontFamily: 'TT Smalls',
      fontSize: 15,
      height: 1.6,
      fontWeight: FontWeight.w700);

  static const TextStyle textRegular = TextStyle(
      fontFamily: 'Inter',
      fontSize: 15,
      height: 1.6,
      fontWeight: FontWeight.w400);

  static const TextStyle textCaption = TextStyle(
      fontFamily: 'Inter',
      fontSize: 9,
      height: 1.2,
      fontWeight: FontWeight.w500);

  static const TextStyle subText = TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w400);

  static const TextStyle scoreText = TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      height: 2.4,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w900);
}
