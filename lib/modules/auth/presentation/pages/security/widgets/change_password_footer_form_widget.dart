import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordFooterWidget extends StatelessWidget {
  const ChangePasswordFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: RichText(
        text: TextSpan(
          text: AppStrings.notAccount,
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
          children: [
            const WidgetSpan(child: SizedBox(width: 5)),
            TextSpan(
              text: AppStrings.signUp,
              style: TextStyle(
                color: const Color(0xFFF47C2C),
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.go('/register');
                },
            ),
          ],
        ),
      ),
    );
  }
}
