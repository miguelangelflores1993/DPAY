import 'package:app/core/ui/theme/app_colors.dart';
import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UIInputDecoration {
  static List<BoxShadow> customBoxShadow = [
    BoxShadow(
      //black
      color: Colors.grey.withValues(alpha: 0.025),
      blurRadius: 12,
    ),
  ];
  static InputDecoration input({
    String? labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool filled = false,
    Color fillColor = Colors.white,
    bool enabled = true,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
  }) {
    return InputDecoration(
      counterText: '',
      alignLabelWithHint: true,
      filled: filled,
      fillColor: fillColor,
      enabled: enabled,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedErrorBorder: DecoratedInputBorder(
        shadow: customBoxShadow,
        child: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEA4335), width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      border: DecoratedInputBorder(
        shadow: customBoxShadow,
        child: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      errorBorder: DecoratedInputBorder(
        shadow: customBoxShadow,
        child: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEA4335), width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      enabledBorder:
          enabledBorder ??
          DecoratedInputBorder(
            shadow: customBoxShadow,
            child: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
      focusedBorder:
          focusedBorder ??
          DecoratedInputBorder(
            shadow: customBoxShadow,
            child: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
      labelStyle: TextStyle(
        fontFamily: AppColors.fontFamily,
        fontSize: 16.sp,
        color: const Color(0xFF1C1C24),
      ),
      floatingLabelStyle: TextStyle(
        fontFamily: AppColors.fontFamily,
        fontSize: 16.sp,
        color: const Color(0xFF1C1C24),
        fontWeight: FontWeight.w500,
      ),
      errorStyle: TextStyle(
        fontFamily: AppColors.fontFamily,
        color: Colors.red,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        fontFamily: AppColors.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF6B6C7E),
      ),
    );
  }
}
