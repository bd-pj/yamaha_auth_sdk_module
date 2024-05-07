import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService extends GetxController {
  static LocalAuthService get instance => Get.put(LocalAuthService());

  final LocalAuthentication _auth = LocalAuthentication();
  final _isAuthenticating = false.obs;

  bool get isAuthenticating => _isAuthenticating.value;

  Future<bool> isAuthenticated() async {
    bool authenticated = false;
    try {
      _isAuthenticating.value = true;
      authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint or face to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      _isAuthenticating.value = false;
    } on PlatformException catch (e) {
      print(e);
      _isAuthenticating.value = false;
    }

    return authenticated;
  }
}
