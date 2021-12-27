import 'package:ecommerce_app/core/constant/storage_constant/storage_constant.dart';
import 'package:get_storage/get_storage.dart';

class LocalDBUtils {
  static saveJWTToken(String? token) {
    GetStorage getStorage = GetStorage(StorageConstant.authStorage);
    getStorage.write(StorageConstant.jwtToken, token);
  }

  static String getJWTToken() {
    GetStorage getStorage = GetStorage(StorageConstant.authStorage);
    return getStorage.read(StorageConstant.jwtToken);
  }

  static void deleteJWTToken() {
    GetStorage getStorage = GetStorage(StorageConstant.userDetails);
    getStorage.remove(StorageConstant.jwtToken);
  }

  static saveAgencyID(String? token) {
    GetStorage getStorage = GetStorage(StorageConstant.userDetails);
    getStorage.write(StorageConstant.agencyID, token);
  }

  static String getAgencyID() {
    GetStorage getStorage = GetStorage(StorageConstant.userDetails);
    return getStorage.read(StorageConstant.agencyID);
  }

  static void deleteAgencyID() {
    GetStorage getStorage = GetStorage(StorageConstant.userDetails);
    getStorage.remove(StorageConstant.agencyID);
  }
}
