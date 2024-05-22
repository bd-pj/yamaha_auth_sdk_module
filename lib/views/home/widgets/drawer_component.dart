import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/utils/app_sizes.dart';
import 'package:yamaha_auth_module/utils/helpers/api_main_constants.dart';
import 'package:yamaha_auth_module/utils/helpers/authentication_repository.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';
import 'package:yamaha_auth_module/views/login/local_auth_page.dart';
import 'package:yamaha_auth_module/views/login/login_page.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  var isLocalAuthEnabled = AuthenticationRepository.instance
      .readData(JPapiMainConstants.isLocalAuthEnabled);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(JPAppSizes.spaceXs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(JPAppSizes.defaultSpace),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text(JPTexts.logout),
                onTap: () {
                  Get.offAll(() => isLocalAuthEnabled
                      ? const LocalAuthPage()
                      : const LoginPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
