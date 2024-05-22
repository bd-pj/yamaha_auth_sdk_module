import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flutter_method_channel_handler.dart';
import 'utils/bindings/general_bindings.dart';
import 'utils/helpers/api_main_constants.dart';
import 'utils/helpers/authentication_repository.dart';
import 'utils/theme/theme.dart';
import 'views/login/local_auth_page.dart';
import 'views/login/login_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final firstConnexionDateString = AuthenticationRepository.instance
      .readData(JPapiMainConstants.firstConnexionDateKey);
  final DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    FlutterMethodChannelHandler.setUpMethodChannel();
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
      initialRoute: "/",
      home: isFirstConnexion() ? const LoginPage() : const LocalAuthPage(),
    );
  }
}
