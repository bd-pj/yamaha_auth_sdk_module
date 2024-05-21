import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/utils/bindings/general_bindings.dart';
import 'package:yamaha_auth_module/utils/helpers/api_main_constants.dart';
import 'package:yamaha_auth_module/utils/helpers/authentication_repository.dart';
import 'package:yamaha_auth_module/utils/theme/theme.dart';
import 'package:yamaha_auth_module/views/login/local_auth_page.dart';
import 'package:yamaha_auth_module/views/login/login_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final firstConnexionDateString = AuthenticationRepository.instance
      .readData(JPapiMainConstants.firstConnexionDateKey);
  final DateTime now = DateTime.now();

  var isLocalAuthEnabled = AuthenticationRepository.instance
      .readData(JPapiMainConstants.isLocalAuthEnabled);

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  bool isFirstConnexion() {
    /* 
     * // Todo: Before deployment
     * Remember to set the correct token lifetime value in 
     * lib/utils/helpers/api_main_constants.dart
     * and replace inMinutes with inDays
     */
    if (firstConnexionDateString == null ||
        now.difference(DateTime.parse(firstConnexionDateString)).inMinutes >=
            JPapiMainConstants.tokenLifetime) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      // home: isFirstConnexion() ? const LoginPage() : const LocalAuthPage(),
      home: const LoginPage(),
    );
  }
}
