import 'package:ecommerce_app/core/api/app_urls.dart';
import 'package:ecommerce_app/core/api/http_rerquest.dart';
import 'package:ecommerce_app/core/utils/local_auth.dart';

class CategoryListModel {
  List<Category>? category;

  CategoryListModel({this.category});

  CategoryListModel.fromJson(Map<String, dynamic> json) {}
  _fromJson(Map<String, dynamic> json) {
    try {
      if (json['category'] != null) {
        category = <Category>[];
        json['category'].forEach((v) {
          category!.add(new Category.fromJson(v));
        });
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<void> callApi() async {
    try {
      Map<String, dynamic>? res = await HttpHelper.get(
        AppUrls.categoryUrl,
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
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

class Category {
  String? name;
  String? photo;
  String? url;
  List<Subs>? subs;

  Category({this.name, this.photo, this.url, this.subs});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    url = json['url'];
    if (json['subs'] != null) {
      subs = <Subs>[];
      json['subs'].forEach((v) {
        subs!.add(new Subs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['url'] = this.url;
    if (this.subs != null) {
      data['subs'] = this.subs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subs {
  String? name;
  String? url;
  List<Childs>? childs;

  Subs({this.name, this.url, this.childs});

  Subs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs!.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    if (this.childs != null) {
      data['childs'] = this.childs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  String? name;
  String? url;

  Childs({this.name, this.url});

  Childs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
