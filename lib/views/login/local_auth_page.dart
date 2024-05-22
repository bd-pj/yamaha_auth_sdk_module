import 'package:flutter/material.dart';
import 'package:yamaha_auth_module/utils/app_images.dart';
import 'package:yamaha_auth_module/utils/app_sizes.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';
import 'package:yamaha_auth_module/views/login/widgets/local_auth_button.dart';

class LocalAuthPage extends StatelessWidget {
  const LocalAuthPage({super.key});

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
                    JPTexts.localAuthLoginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),

              /// rename this by LocalAuthComponent
              const LocalAuthButton(),
            ],
          ),
        ),
      ),
    );
  }
}
