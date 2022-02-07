import 'package:ecommerce_app/core/model/forgot_password_model.dart';
import 'package:ecommerce_app/core/model/register_user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordViewModel extends GetxController {
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

  forgotPasswordMethod({String? phone}) async {
    try {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      ForgotPasswordModel tempModel = ForgotPasswordModel();
      await tempModel.callApi(
        phone: phone,
      );
      forgotPasswordModel = tempModel;
      update();
      EasyLoading.dismiss();
    } catch (e, t) {}
  }

  ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel();
}
