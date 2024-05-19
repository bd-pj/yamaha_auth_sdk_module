import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/controllers/login/login_controller.dart';
import 'package:yamaha_auth_module/utils/app_sizes.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';

class LocalAuthButton extends StatefulWidget {
  const LocalAuthButton({super.key});

  @override
  State<LocalAuthButton> createState() => _LocalAuthButtonState();
}

class _LocalAuthButtonState extends State<LocalAuthButton> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: JPAppSizes.spaceBetweenSections),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => controller.authenticateWithLocalAuth(),
                child: const Text(JPTexts.useLocalAuth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
