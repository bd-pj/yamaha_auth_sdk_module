import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/controllers/login/login_controller.dart';
import 'package:yamaha_auth_module/utils/app_colors.dart';
import 'package:yamaha_auth_module/utils/app_sizes.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';
import 'package:yamaha_auth_module/utils/validators/validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
            /// Email field
            TextFormField(
              controller: controller.email,
              validator: (value) => JPValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: JPTexts.email,
                floatingLabelStyle: TextStyle(
                  color: JPAppColors.black,
                ),
              ),
            ),
            const SizedBox(height: JPAppSizes.spaceBetweenInputFields),

            /// Password field
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => JPValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: JPTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? CupertinoIcons.eye_slash
                        : Icons.remove_red_eye_outlined),
                  ),
                ),
              ),
            ),
            const SizedBox(height: JPAppSizes.defaultSpace),
            const SizedBox(height: JPAppSizes.defaultSpace),

            /// Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.login(),
                child: const Text(JPTexts.logIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
