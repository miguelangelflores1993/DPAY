import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordHeaderWidget extends StatelessWidget {
  const ChangePasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            icon: const Icon(Icons.arrow_back),
            onPressed: context.pop,
          ),
          Text(
            AppStrings.security,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
