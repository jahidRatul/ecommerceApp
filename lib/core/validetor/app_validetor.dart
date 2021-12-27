import 'package:get/get.dart';

class AppValidTor {
  static String? isEmail(String s) =>
      GetUtils.isEmail(s) ? null : "Enter a valid email";

  static String? isEmpty(String s) =>
      GetUtils.isNullOrBlank(s)! ? "this field required!" : null;

  static String? isPassword(String s) {
    if (s.isBlank! || s.isEmpty) return "this field required!";
    return GetUtils.isLengthLessThan(s, 8) ? "min password length is 8" : null;
  }

  static String? isConfirmedPassword(String s, String password) {
    return s != password ? "both password not matched" : null;
  }

  static String? isMobile(String s) {
    if (s.isBlank! || s.isEmpty) return "this field required!";
    return checkMobileNo(s) ? null : "Enter a valid mobile no";
  }

// Custom regExpr for bd no with 88, 01
  static bool checkMobileNo(String s) =>
      hasMatch(s, r'^(?:\+?88)?01[13-9]\d{8}$');

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
