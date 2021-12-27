import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///install
/*
  #toast
  toast: ^0.1.5
*/

class FlutterToastCustom {
  static void showErrorToast({
    String? message,
  }) {
    Fluttertoast.showToast(
        msg: message!,
        backgroundColor: Colors.red.shade400,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white);
  }

  static void showSuccessToast({
    String? message,
  }) {
    Fluttertoast.showToast(
        msg: message!,
        backgroundColor: Colors.green.shade400,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white);
  }
}
