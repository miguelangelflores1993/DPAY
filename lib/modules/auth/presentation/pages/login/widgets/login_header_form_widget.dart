import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:app/shared/constants/responsive_size.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => context.goNamed('home'),
            child: AppAdaptiveImage(
              AppImages.logo01,
              width: ResponsiveSize.getSize(
                mobile: 40.w,
                tablet: TabletSize(portrait: 30.w, horizontal: 20.w),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            AppStrings.loginTitle,
            style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Divider(
            height: 5.h,
            thickness: 1.5,
            color: Colors.black.withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }
}
