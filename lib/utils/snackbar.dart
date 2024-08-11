import 'package:flutter/material.dart';

class SnackbarUtil {
  // static final snack = SnackbarUtil().viewSnackBar();
  static viewSnackBar({required String text, required BuildContext context}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
