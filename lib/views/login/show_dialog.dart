import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamaha_auth_module/controllers/login/login_service.dart';
import 'package:yamaha_auth_module/utils/app_colors.dart';
import 'package:yamaha_auth_module/utils/text_strings.dart';

class JPShowDialog extends GetxController {
  static showCustomDialog({required String title, required String message}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: JPAppColors.color_2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: JPAppColors.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: JPAppColors.darkGrey.withOpacity(0.8),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => LoginService.deactivateLocalAuthentication(),
                child: Text(
                  JPTexts.no,
                  style: TextStyle(
                    color: JPAppColors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => LoginService.activateLocalAuthentication(),
                style: TextButton.styleFrom(
                  backgroundColor: JPAppColors.color_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  JPTexts.yes,
                  style: TextStyle(
                      color: JPAppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
