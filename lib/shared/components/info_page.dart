import 'package:app/core/ui/widgets/atoms/buttons/app_button.dart';
import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
    this.showRetryButton = true,
    this.showSupportButton = true,
  });

  final String image;
  final String title;
  final String subtitle;
  final bool showRetryButton;
  final bool showSupportButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppAdaptiveImage(
          AppImages.logo02,
          width: 22.w,
        ),
        toolbarHeight: 6.h,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 15.h),
            AppAdaptiveImage(image, width: 25.w),

            Text(
              title,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF313131),
              ),
            ),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF6B6C7E),
                fontWeight: FontWeight.w500,
              ),
            ),
            if (showRetryButton)
              AppButton(
                label: AppStrings.retry,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {},
                width: 40.w,
                height: 5.h,
              ),
            if (showSupportButton)
              AppButton(
                label: AppStrings.contactSupport,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {},
                width: 50.w,
                height: 5.h,
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF6B6C7E),
              ),
          ],
        ),
      ),
    );
  }
}
