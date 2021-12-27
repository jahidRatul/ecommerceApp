import 'package:ecommerce_app/core/model/category_list_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

class CategoryListViewModel extends GetxController {
  @override
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

  getCategoryList() async {
    try {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      CategoryListModel temp = CategoryListModel();
      await temp.callApi();
      // print("from view model ${temp.success}");

      categoryListModel = temp;
      update();
      EasyLoading.dismiss();
    } catch (e, t) {}
  }

  CategoryListModel categoryListModel = CategoryListModel();
}
