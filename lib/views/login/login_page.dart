import 'package:flutter/material.dart';
import 'package:yamaha_auth_module/utils/app_images.dart';
import 'package:yamaha_auth_module/utils/app_sizes.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';
import 'package:yamaha_auth_module/views/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: JPAppSizes.spaceXL,
            left: JPAppSizes.defaultSpace,
            bottom: JPAppSizes.defaultSpace,
            right: JPAppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage(JPAppImages.logoButterflydance),
                  ),
                  Text(
                    JPTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
