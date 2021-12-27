import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String? bodyText;
  final String? titleText;
  final VoidCallback? yesPress;
  final VoidCallback? noPress;

  ConfirmDialog({
    this.bodyText,
    this.titleText,
    this.noPress,
    this.yesPress,
  });

  final textStyle = TextStyle(
    // fontFamily: FontName.rubikBold,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleText!),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      actionsOverflowButtonSpacing: 20,
      actions: [
        TextButton(
            onPressed: noPress,
            child: Text(
              "NO",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        TextButton(
            onPressed: yesPress,
            child: Text(
              "YES",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            )),
      ],
      content: Text(bodyText!),
    );
  }
}
