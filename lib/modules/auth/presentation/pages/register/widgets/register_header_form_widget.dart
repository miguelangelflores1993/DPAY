import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/components/bar_gradient.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HeaderRegisterWidget extends StatelessWidget {
  const HeaderRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            context.goNamed('home');
          },
          child: AppAdaptiveImage(AppImages.logo01, width: 45.w),
        ),
        Text(
          AppStrings.register,
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        // Row(
        //   spacing: 5,
        //   children: [
        //     AppAdaptiveImage(AppImages.gift, width: 4.5.w),
        //     Text(
        //       AppStrings.freeGift('Bs.50'),
        //       style: TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.bold),
        //     ),
        //   ],
        // ),
        // Text(
        //   AppStrings.complete,
        //   style: TextStyle(fontSize: 15.6.sp, color: const Color(0xFF61677D)),
        // ),
        DynamicGradientBar(
          value: 0.5,
          height: 1.h,
          startColor: const Color(0xF0FF5F00),
          endColor: const Color(0xFFFFA400),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.grey.shade300,
        ),

        // Text(
        //   AppStrings.cupon,
        //   style: TextStyle(fontSize: 16.sp, color: const Color(0xFF61677D)),
        // ),
      ],
    );
  }
}
