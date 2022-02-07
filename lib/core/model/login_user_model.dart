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

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = (json['user'] != null ? new User.fromJson(json['user']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? empId;
  String? empCode;
  String? empName;
  dynamic empNameBng;
  dynamic empPhotoType;
  dynamic empPhotoLink;
  List<UserRole>? userRole;
  DptDivision? dptDivision;
  Department? department;
  Designation? designation;
  UserInfo? userInfo;

  User(
      {this.empId,
      this.empCode,
      this.empName,
      this.empNameBng,
      this.empPhotoType,
      this.empPhotoLink,
      this.userRole,
      this.dptDivision,
      this.department,
      this.designation,
      this.userInfo});

  User.fromJson(Map<String, dynamic> json) {
    empId = json['emp_id'];
    empCode = json['emp_code'];
    empName = json['emp_name'];
    empNameBng = json['emp_name_bng'];
    empPhotoType = json['emp_photo_type'];
    empPhotoLink = json['emp_photo_link'];
    if (json['user_role'] != null) {
      userRole = <UserRole>[];
      json['user_role'].forEach((v) {
        userRole!.add(new UserRole.fromJson(v));
      });
    }
    dptDivision = (json['dpt_division'] != null
        ? new DptDivision.fromJson(json['dpt_division'])
        : null);
    department = (json['department'] != null
        ? new Department.fromJson(json['department'])
        : null);
    designation = (json['designation'] != null
        ? new Designation.fromJson(json['designation'])
        : null);
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_id'] = this.empId;
    data['emp_code'] = this.empCode;
    data['emp_name'] = this.empName;
    data['emp_name_bng'] = this.empNameBng;
    data['emp_photo_type'] = this.empPhotoType;
    data['emp_photo_link'] = this.empPhotoLink;
    if (this.userRole != null) {
      data['user_role'] = this.userRole!.map((v) => v.toJson()).toList();
    }
    if (this.dptDivision != null) {
      data['dpt_division'] = this.dptDivision!.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.designation != null) {
      data['designation'] = this.designation!.toJson();
    }
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserRole {
  int? roleId;
  String? roleName;

  UserRole({required this.roleId, required this.roleName});

  UserRole.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    return data;
  }
}

class DptDivision {
  String? dptDivisionName;
  dynamic dptDivisionNameBng;

  DptDivision(
      {required this.dptDivisionName, required this.dptDivisionNameBng});

  DptDivision.fromJson(Map<String, dynamic> json) {
    dptDivisionName = json['dpt_division_name'];
    dptDivisionNameBng = json['dpt_division_name_bng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dpt_division_name'] = this.dptDivisionName;
    data['dpt_division_name_bng'] = this.dptDivisionNameBng;
    return data;
  }
}

class Department {
  String? departmentName;
  String? departmentNameBng;

  Department({required this.departmentName, required this.departmentNameBng});

  Department.fromJson(Map<String, dynamic> json) {
    departmentName = json['department_name'];
    departmentNameBng = json['department_name_bng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_name'] = this.departmentName;
    data['department_name_bng'] = this.departmentNameBng;
    return data;
  }
}

class Designation {
  String? designation;
  String? designationBng;

  Designation({required this.designation, required this.designationBng});

  Designation.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
    designationBng = json['designation_bng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation'] = this.designation;
    data['designation_bng'] = this.designationBng;
    return data;
  }
}

class UserInfo {
  String? agencyId;
  String? agencyTypeId;
  String? agencyName;
  dynamic agencyNameBn;
  String? address;
  String? phoneNo;
  dynamic faxNo;
  String? mobileNo;
  String? contactPerson;
  String? agencyEmail;
  String? activeYn;

  UserInfo(
      {this.agencyId,
      this.agencyTypeId,
      this.agencyName,
      this.agencyNameBn,
      this.address,
      this.phoneNo,
      this.faxNo,
      this.mobileNo,
      this.contactPerson,
      this.agencyEmail,
      this.activeYn});

  UserInfo.fromJson(Map<String, dynamic> json) {
    agencyId = json['agency_id'];
    agencyTypeId = json['agency_type_id'];
    agencyName = json['agency_name'];
    agencyNameBn = json['agency_name_bn'];
    address = json['address'];
    phoneNo = json['phone_no'];
    faxNo = json['fax_no'];
    mobileNo = json['mobile_no'];
    contactPerson = json['contact_person'];
    agencyEmail = json['agency_email'];
    activeYn = json['active_yn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agency_id'] = this.agencyId;
    data['agency_type_id'] = this.agencyTypeId;
    data['agency_name'] = this.agencyName;
    data['agency_name_bn'] = this.agencyNameBn;
    data['address'] = this.address;
    data['phone_no'] = this.phoneNo;
    data['fax_no'] = this.faxNo;
    data['mobile_no'] = this.mobileNo;
    data['contact_person'] = this.contactPerson;
    data['agency_email'] = this.agencyEmail;
    data['active_yn'] = this.activeYn;
    return data;
  }
}
