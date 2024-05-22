import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yamaha_auth_module/app.dart';
import 'package:yamaha_auth_module/utils/helpers/authentication_repository.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init().then((value) => Get.put(AuthenticationRepository()));

  // Await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MaterialApp(
      home: Navigator(
        onPopPage: ((route, result) => route.didPop(false)),
        pages: const [
          MaterialPage(
            child: App(),
          )
        ],
      ),
    ),
  );
}
