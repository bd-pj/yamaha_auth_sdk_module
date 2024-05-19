import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/text_strings.dart';

class ListViewComponent extends StatelessWidget {
  const ListViewComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        displayValidationCode(JPTexts.accountName_1, JPTexts.validationCode_1),
        displayValidationCode(JPTexts.accountName_2, JPTexts.validationCode_2),
        displayValidationCode(JPTexts.accountName_3, JPTexts.validationCode_3),
        displayValidationCode(JPTexts.accountName_4, JPTexts.validationCode_4),
      ],
    );
  }

  Row displayValidationCode(String accountName, String validationCode) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: JPAppSizes.validationCodePadding),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  JPHelperFunctions.truncateText(accountName, 28),
                  style: const TextStyle(
                    fontSize: JPAppSizes.fontSizeLg,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  validationCode,
                  style: TextStyle(
                    fontSize: JPAppSizes.fontSizeXL,
                    fontWeight: FontWeight.w300,
                    color: JPAppColors.color_1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
