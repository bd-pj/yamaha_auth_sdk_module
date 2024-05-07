import 'package:get/get.dart';
import 'package:yamaha_auth_module/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
