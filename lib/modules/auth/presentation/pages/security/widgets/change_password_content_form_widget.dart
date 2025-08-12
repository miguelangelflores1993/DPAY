import 'package:app/core/ui/widgets/atoms/textfield/app_text_field.dart';
import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordContentWidget extends StatelessWidget {
  const ChangePasswordContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            spacing: 12,
            children: [
              AppAdaptiveImage(
                AppImages.lock,
                width: 6.w,
              ),
              Text(
                AppStrings.changePassword,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          AppTextField.password(
            labelText: AppStrings.currentPassword,
            hintText: AppStrings.hintCurrentPassword,
            name: 'currentPassword',
            textInputAction: TextInputAction.next,
            context: context,
            additionalValidators: AppTextField.buildPasswordValidators(),
          ),

          AppTextField.password(
            labelText: AppStrings.newPassword,
            hintText: AppStrings.hintNewPassword,
            context: context,
            name: 'newPassword',
            additionalValidators: AppTextField.buildPasswordValidators(),
          ),

          PasswordValidationWidget(
            isValid: true,
            text: AppStrings.passwordLengthError,
          ),

          PasswordValidationWidget(
            isValid: false,
            text: AppStrings.passwordUpperLowerCase,
          ),

          PasswordValidationWidget(
            isValid: false,
            text: AppStrings.passwordSpecialCharacters,
          ),
        ],
      ),
    );
  }
}

class PasswordValidationWidget extends StatelessWidget {
  const PasswordValidationWidget({
    required this.isValid,
    required this.text,
    super.key,
  });

  final bool isValid;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        AppAdaptiveImage(
          isValid ? AppImages.check : AppImages.validationError,
          width: 4.w,
          colorFilter: ColorFilter.mode(
            isValid ? const Color(0xFF16B512) : const Color(0xFFE43629),
            BlendMode.srcIn,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15.sp, color: const Color(0xFF7C8BA0), fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
