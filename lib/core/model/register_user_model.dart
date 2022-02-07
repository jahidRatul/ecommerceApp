import 'package:ecommerce_app/core/api/app_urls.dart';
import 'package:ecommerce_app/core/api/http_rerquest.dart';

class RegisterUserModel {
  Success? success;
  Error? error;

  RegisterUserModel({this.success, this.error});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    this._fromJson(json);
  }

  _fromJson(Map<String, dynamic> json) {
    try {
      success = json['success'] != null
          ? new Success.fromJson(json['success'])
          : null;
      error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }

  Future<void> callApi(
      {String? name,
      String? phone,
      String? address,
      String? password,
      String? confirmPassword}) async {
    try {
      Map<String, dynamic>? res = await HttpHelper.post(
        AppUrls.registerUserUrl,
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: {
          "name": name,
          "phone": phone,
          "address": address,
          "password": password,
          "password_confirmation": confirmPassword
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

class Success {
  String? token;
  String? name;

  Success({this.token, this.name});

  Success.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}

class Error {
  List<String>? phone;
  List<String>? password;

  Error({this.phone, this.password});

  Error.fromJson(Map<String, dynamic> json) {
    phone = json['phone']?.cast<String>();
    password = json['password']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}
