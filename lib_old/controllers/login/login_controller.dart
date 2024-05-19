import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_service.dart';
import '../../utils/helpers/api_main_constants.dart';
import '../../utils/helpers/authentication_repository.dart';
import '../../utils/helpers/local_auth_service.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final loginService = LoginService();

  Future<void> login() async {
    try {
      final token = loginService.performLoginRequest(email.text, password.text);

      return token;
    } finally {}
  }

  Future<dynamic> authenticateWithLocalAuth() async {
    final isAuthenticated = await LocalAuthService.instance.isAuthenticated();
    try {
      final firstConnexionDate = AuthenticationRepository()
          .readData(JPapiMainConstants.firstConnexionDateKey);
      DateTime currentDate = DateTime.now();
      DateTime parsedFirstConnexionDate = DateTime.parse(firstConnexionDate);
      Duration difference = currentDate.difference(parsedFirstConnexionDate);
      if (difference.inMinutes > JPapiMainConstants.tokenLifetime) {
        return "authentication expired";
      } else {
        if (!isAuthenticated) {
          return "authentication not done";
        }
        final token =
            AuthenticationRepository().readData(JPapiMainConstants.tokenAuth);
        return token;
      }
    } catch (e) {
      return null;
    }
  }
}
