import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/controllers/login/login_service.dart';
import 'package:yamaha_auth_module/utils/helpers/local_auth_service.dart';
import 'package:yamaha_auth_module/utils/helpers/network_manager.dart';
import 'package:yamaha_auth_module/utils/popups/loaders.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final loginService = LoginService();

  Future<void> login() async {
    try {
      // Check Internet Connectivity
      final isConnectivity = await NetworkManager.instance.initConnectivity();

      if (!isConnectivity) {
        JPLoaders.warningSnackBar(
            title: JPTexts.youAreCurrentlyOffline,
            message: JPTexts.checkInternetConnection);
        return;
      }

      if (!loginFormKey.currentState!.validate()) return;

      if (loginFormKey.currentState!.validate()) {
        loginService.performLoginRequest(email.text, password.text);
      }

      return;
    } catch (e) {
      JPLoaders.errorSnackBar(title: 'Oops !!!', message: e.toString());
    } finally {}
  }

  Future<void> authenticateWithLocalAuth() async {
    final isAuthenticated = await LocalAuthService.instance.isAuthenticated();
    if (isAuthenticated) {
      // return Get.offAll(() => const HomePage());
      return SystemNavigator.pop(animated: true);
    }
  }
}
