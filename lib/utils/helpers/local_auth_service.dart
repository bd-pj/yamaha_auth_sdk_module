import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:yamaha_auth_module/utils/popups/loaders.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';

class LocalAuthService extends GetxController {
  static LocalAuthService get instance => Get.put(LocalAuthService());

  final LocalAuthentication _auth = LocalAuthentication();
  final _isAuthenticating = false.obs;

  bool get isAuthenticating => _isAuthenticating.value;

  Future<bool> isAuthenticated() async {
    bool authenticated = false;
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      if (!canCheckBiometrics) {
        return JPLoaders.errorSnackBar(
            title: JPTexts.localAuthDisableErrorTitle,
            message: JPTexts.localAuthDisableErrorMessage);
      }

      _isAuthenticating.value = true;
      authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint or face to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      _isAuthenticating.value = false;
    } on PlatformException catch (error) {
      _isAuthenticating.value = false;
    }

    return authenticated;
  }

  Future<bool> isLocalAuthenticationAvailable() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();

    if (canAuthenticate) {
      return true;
    }

    return false;
  }
}
