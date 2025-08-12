import 'package:app/core/ui/widgets/atoms/textfield/app_text_field.dart';
import 'package:app/shared/components/underline_text.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LoginContentWidget extends StatelessWidget {
  const LoginContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        AppTextField.required(
          labelText: AppStrings.email,
          hintText: AppStrings.hintEmail,
          keyboardType: TextInputType.emailAddress,
          name: 'email',
          context: context,
          additionalValidators: AppTextField.buildEmailValidators(),
          textInputAction: TextInputAction.next,
        ),

        SizedBox(height: 1.h),

        AppTextField.password(
          labelText: AppStrings.password,
          hintText: AppStrings.hintPassword,
          context: context,
          name: 'password',
          maxLength: 20,
        ),
        SizedBox(height: 0.5.h),

        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.push('/forgot_password'),
          child: UnderlineText(
            AppStrings.forgotPassword,
            spacing: 0,
            underlineColor: const Color(0xFF7C8BA0),
            style: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF7C8BA0),
            ),
          ),
        ),
      ],
    );
  }
}
