import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  final String? bodyText;
  final String? titleText;
  final VoidCallback? yesPress;

  ExitDialog({
    this.bodyText,
    this.titleText,
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
            onPressed: yesPress,
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ],
      content: Text(bodyText!),
    );
  }
}
