import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yamaha_auth_module/app.dart';
import 'package:yamaha_auth_module/utils/helpers/authentication_repository.dart';

void main() async {
  // Init Local Storage
  await GetStorage.init().then((value) => Get.put(AuthenticationRepository()));
  runApp(const GetMaterialApp(
    home: App(),
  ));
}
