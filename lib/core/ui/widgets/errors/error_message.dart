import 'package:app/core/ui/widgets/atoms/buttons/app_button.dart';
import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class MessageError extends StatelessWidget {
  const MessageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppAdaptiveImage(
              AppImages.errorPageCover,
              width: 50.w,
              height: 50.w,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            AppStrings.errorPage,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF6B6C7E),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.5.h),
          AppButton(
            onPressed: () {
              context.pop();
            },
            label: AppStrings.goBack,
          ),
        ],
      ),
    );
  }
}
