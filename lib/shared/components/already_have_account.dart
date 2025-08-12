import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class AlreadyHaveAccountWidget extends StatefulWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  State<AlreadyHaveAccountWidget> createState() =>
      _AlreadyHaveAccountWidgetState();
}

class _AlreadyHaveAccountWidgetState extends State<AlreadyHaveAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Expanded(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontSize: 15.sp),
                children: [
                  TextSpan(text: AppStrings.alreadyHaveAccount),
                  TextSpan(
                    text: AppStrings.loginHere,
                    style: const TextStyle(color: Color(0xFFFF7622)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push('/login');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
