import 'package:ecommerce_app/core/api/app_urls.dart';
import 'package:ecommerce_app/core/api/http_rerquest.dart';

class LoginUserModel {
  String? token;
  String? name;
  String? error;

  LoginUserModel({this.token, this.name});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      token = json['token'];
      name = json['name'];
      error = json['error'];
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['error'] = this.error;
    return data;
  }

  Future<void> callApi({
    String? phone,
    String? password,
  }) async {
    try {
      Map<String, dynamic>? res = await HttpHelper.post(
        AppUrls.loginUserUrl,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: {
          "phone": phone,
          "password": password,
        },
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
