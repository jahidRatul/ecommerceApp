import 'package:ecommerce_app/core/view_model/category_list_view_model.dart';
import 'package:ecommerce_app/core/view_model/login_user_view_model.dart';
import 'package:ecommerce_app/core/view_model/register_user_view_model.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterUserViewModel());
    Get.put(LoginUserViewModel());
  }
}
