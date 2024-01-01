import 'package:flutter/material.dart';

class DemoTextStyle {
  // Example of static TextStyles
  static const TextStyle headline1 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );

  static TextStyle copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? headline1.fontSize,
      fontWeight: fontWeight ?? headline1.fontWeight,
      color: color ?? headline1.color,
    );
  }
}
