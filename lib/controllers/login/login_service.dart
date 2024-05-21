import 'dart:convert';

// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yamaha_auth_module/models/login_response_data.dart';
import 'package:yamaha_auth_module/utils/helpers/api_main_constants.dart';
import 'package:yamaha_auth_module/utils/helpers/authentication_repository.dart';
import 'package:yamaha_auth_module/utils/helpers/local_auth_service.dart';
import 'package:yamaha_auth_module/utils/popups/loaders.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';
import 'package:yamaha_auth_module/views/home/home_page.dart';
import 'package:yamaha_auth_module/views/login/show_dialog.dart';

class LoginService {
  static Future performLoginRequest(String email, String password) async {
    var loginUrl = Uri.parse(JPapiMainConstants.loginUrl);
    var request = http.MultipartRequest('POST', loginUrl);
    request.fields['login_id'] = email;
    request.fields['password'] = password;

    final firstConnexionDate = DateTime.now();

    /* 
     * // Todo:
     * Comment the following code to make the app work without the API 
     */

    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);
      LoginResponseData loginResponse = LoginResponseData.fromJson(data);

      /*  
       * Show Dialog if device support local authentication
       */
      if (await LocalAuthService.instance.isLocalAuthenticationAvailable()) {
        return JPShowDialog.showCustomDialog(
            title: JPTexts.loginDialogTitle,
            message: JPTexts.loginDialogMessage);
      }

      return Get.offAll(() => const HomePage());

      /* // Todo: 
       * Do not delete this yet, it may be useful in the future.
       */
      // final loginID = loginResponse.links.self.loginId;
      // final token = loginResponse.tokenAuth;

      // AuthenticationRepository.instance
      //     .saveData(JPapiMainConstants.lgoinID, loginID);
      // AuthenticationRepository.instance
      //     .saveData(JPapiMainConstants.tokenAuth, token);

      // AuthenticationRepository.instance.saveData(
      //     JPapiMainConstants.firstConnexionDateKey,
      //     firstConnexionDate.toString());

      // return Get.offAll(() => const HomePage());
    } else {
      return JPLoaders.errorSnackBar(
          title: JPTexts.loginErrorMessageTitle,
          message: JPTexts.loginErrorMessage);
    }

    /* // Todo: 
     * Remove all of the following code if you are using the API 
     */
    // AuthenticationRepository.instance.saveData(
    //     JPapiMainConstants.firstConnexionDateKey,
    //     firstConnexionDate.toString());

    // return Get.offAll(() => const HomePage());

    /* // Todo: 
     * The line below will cause the application to crash, make sure you comment it out before starting the application.
     */
    // return SystemNavigator.pop(animated: true);
  }

  static activateLocalAuthentication() {
    AuthenticationRepository.instance
        .saveData(JPapiMainConstants.isLocalAuthEnabled, true);
    return Get.offAll(() => const HomePage());
  }

  static deactivateLocalAuthentication() {
    AuthenticationRepository.instance
        .saveData(JPapiMainConstants.isLocalAuthEnabled, false);
    return Get.offAll(() => const HomePage());
  }
}
