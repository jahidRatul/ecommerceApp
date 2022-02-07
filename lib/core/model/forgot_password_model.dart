import 'package:ecommerce_app/core/api/app_urls.dart';
import 'package:ecommerce_app/core/api/http_rerquest.dart';

class ForgotPasswordModel {
  String? success;
  String? errors;

  ForgotPasswordModel({this.success, this.errors});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      success = json['success'];
      errors = json['errors'];
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errors'] = this.errors;

    return data;
  }

  Future<void> callApi({
    String? phone,
  }) async {
    try {
      Map<String, dynamic>? res = await HttpHelper.post(
        AppUrls.forgetPasswordUserUrl,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: {"phone": phone},
      );
      if (res == null) return;
      if (res.isEmpty) return;
      return this._fromJson(res);
    } catch (e, t) {
      print(e);
      print(t);
    }
  }
}
