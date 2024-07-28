import 'package:flutter/material.dart';

class Alerts {
  static showAlert(
      {required BuildContext context,
      required String content,
      required Function() onYes,
      required Function() onNo}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Alert !'),
            content: Text(content),
            actions: [
              TextButton(onPressed: onNo, child: Text('No')),
              TextButton(onPressed: onYes, child: Text('Yes'))
            ],
          );
        });
  }
}
