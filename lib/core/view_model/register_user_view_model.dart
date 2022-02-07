import 'package:ecommerce_app/core/model/register_user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegisterUserViewModel extends GetxController {
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  registerUserMethod(
      {String? name,
      String? phone,
      String? address,
      String? password,
      String? confirmPassword}) async {
    try {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      RegisterUserModel tempModel = RegisterUserModel();
      await tempModel.callApi(
          name: name,
          phone: phone,
          address: address,
          password: password,
          confirmPassword: confirmPassword);
      registerUserModel = tempModel;
      update();
      EasyLoading.dismiss();
    } catch (e, t) {}
  }

  RegisterUserModel registerUserModel = RegisterUserModel();
}
