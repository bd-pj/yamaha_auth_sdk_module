import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yamaha_auth_module/models/login_response_data.dart';
import 'package:yamaha_auth_module/utils/helpers/api_main_constants.dart';
import 'package:yamaha_auth_module/utils/helpers/authentication_repository.dart';

class LoginService {
  Future performLoginRequest(String email, String password) async {
    var loginUrl = Uri.parse(JPapiMainConstants.loginUrl);
    var request = http.MultipartRequest('POST', loginUrl);
    request.fields['login_id'] = email;
    request.fields['password'] = password;

    final firstConnexionDate = DateTime.now();

    /* 
     * // Todo:
     * Uncomment the following code to make the app work with the API 
     */
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);
      LoginResponseData loginResponse = LoginResponseData.fromJson(data);

      final loginID = loginResponse.links.self.loginId;
      final token = loginResponse.tokenAuth;

      AuthenticationRepository.instance
          .saveData(JPapiMainConstants.lgoinID, loginID);
      AuthenticationRepository.instance
          .saveData(JPapiMainConstants.tokenAuth, token);

      AuthenticationRepository.instance.saveData(
          JPapiMainConstants.firstConnexionDateKey,
          firstConnexionDate.toString());
      return token;
    }

    /* // Todo: 
     * Remove all of the following code if you are using the API 
    */
    // AuthenticationRepository.instance.saveData(
    //     JPapiMainConstants.firstConnexionDateKey,
    //     firstConnexionDate.toString());

    // return Get.offAll(() => const HomePage());
    return null;
  }
}
