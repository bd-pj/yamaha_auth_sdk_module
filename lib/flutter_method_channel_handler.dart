import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/controllers/login/login_controller.dart';

class FlutterMethodChannelHandler {
  static const MethodChannel _channel =
      MethodChannel('com.example.yamaha_auth_module');

  static void setUpMethodChannel() {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  static Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'login':
        final String email = call.arguments['email'];
        final String password = call.arguments['password'];

        final token = await Get.put(LoginController()).login(email, password);
        return token;
      case 'localAuth':
        final token =
            await Get.put(LoginController()).authenticateWithLocalAuth();
        return token;
    }
  }
}
