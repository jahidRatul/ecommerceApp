import 'package:ecommerce_app/core/model/login_user_model.dart';
import 'package:ecommerce_app/core/utils/local_auth.dart';
import 'package:ecommerce_app/screen/dashboard/dashboard.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginUserViewModel extends GetxController {
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

  signInMethod({
    String? phone,
    String? password,
  }) async {
    try {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      LoginUserModel tempModel = LoginUserModel();
      await tempModel.callApi(password: password, phone: phone);
      loginUserModel = tempModel;

      update();
      EasyLoading.dismiss();

      if (loginUserModel.token != null) {
        Get.to(() => Dashboard());
        LocalDBUtils.saveJWTToken(loginUserModel.token);

        print("getJWTToken:-  ${LocalDBUtils.getJWTToken()}");
        print("getAgencyId:-  ${LocalDBUtils.getAgencyID()}");
      } else {
        // print(errorMsg.value);
      }
    } catch (e, t) {}
  }

  LoginUserModel loginUserModel = LoginUserModel();
}
