import 'package:flutter/material.dart';

class NavigatorHelper {
  static void push(context, Widget newPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }
}
