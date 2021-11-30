import 'package:flutter/material.dart';

class Snackbars {
  static showTextSnackBar({required text, required context}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
