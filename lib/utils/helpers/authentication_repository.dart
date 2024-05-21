import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  void saveData(String key, dynamic value) async {
    if (deviceStorage.read(key) == null) {
      deviceStorage.writeIfNull(key, value);
    }

    deviceStorage.write(key, value);
  }

  readData(String key) {
    return deviceStorage.read(key);
  }

  Future<void> removeData(String key) async {
    return await deviceStorage.remove(key);
  }

  Future<void> clearData() async {
    return await deviceStorage.erase();
  }
}
