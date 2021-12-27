import 'package:flutter/material.dart';

class RemarksDialog extends StatelessWidget {
  final String? remarkText;
  final String? titleText;
  final VoidCallback? yesPress;
  final VoidCallback? noPress;
  final BuildContext? remarksContext;

  RemarksDialog(
      {this.remarkText,
      this.titleText,
      this.noPress,
      this.yesPress,
      this.remarksContext});

  final textStyle = TextStyle(
    // fontFamily: FontName.rubikBold,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext remarksContext) {
    return AlertDialog(
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
      actionsOverflowButtonSpacing: 20,
      actions: [
        TextButton(
            onPressed: noPress,
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            )),
        TextButton(
            onPressed: yesPress,
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ],
      content: Container(
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('REMARK'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              minLines:
                  3, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 32.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                  // ),

                  hintText: 'Input remarks here...',
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
