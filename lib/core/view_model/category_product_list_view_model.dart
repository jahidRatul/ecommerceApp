import 'package:ecommerce_app/core/model/CategoryProductListModel.dart';
import 'package:ecommerce_app/core/model/category_list_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CategoryProductListViewModel extends GetxController {
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

  getCategoryProductList({String? categoryProductsUrl}) async {
    try {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      CategoryProductListModel temp = CategoryProductListModel();
      await temp.callApi(categoryProductsUrl: categoryProductsUrl);
      // print("from view model ${temp.success}");

      categoryProductListModel = temp;
      update();
      EasyLoading.dismiss();
    } catch (e, t) {}
  }

  CategoryProductListModel categoryProductListModel =
      CategoryProductListModel();
}
