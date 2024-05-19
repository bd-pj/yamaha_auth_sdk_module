import 'package:flutter/material.dart';
import '../../utils/app_images.dart';
import '../../utils/app_sizes.dart';
import '../../utils/text_strings.dart';
import 'widgets/local_auth_button.dart';

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
              const LocalAuthButton()
            ],
          ),
        ),
      ),
    );
  }
}
