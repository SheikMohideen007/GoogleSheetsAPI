import 'package:flutter/material.dart';

class SnackbarUtil {
  static final snack = SnackbarUtil().viewSnackBar();
  viewSnackBar() {
    return SnackBar(content: Text('Both fields are required'));
  }
}
