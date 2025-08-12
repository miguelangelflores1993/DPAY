import 'package:app/core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum ButtonType { primary, secondary, text, destructive }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.label,
    super.key,
    this.isEnabled = true,
    this.buttonType = ButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(32)),
    this.border = const BorderSide(
      color: Color(0xFFFF7622),
    ),
    this.backgroundColor,
    this.foregroundColor,
    this.gradient,
    this.splashColor,
    this.fontSize,
  });
  final bool isEnabled;
  final VoidCallback? onPressed;
  final String label;
  final ButtonType buttonType;
  final Widget? icon;
  final bool isLoading;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? border;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Gradient? gradient;
  final Color? splashColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = !isEnabled || onPressed == null || isLoading;

    Color? effectiveBackgroundColor;
    Color effectiveForegroundColor;
    var effectiveBorder = border;
    var effectiveGradient = gradient;

    final effectiveBorderRadius = borderRadius is BorderRadius
        ? (borderRadius! as BorderRadius)
        : (borderRadius?.resolve(Directionality.of(context)) ??
              BorderRadius.circular(8));

    const defaultPrimaryGradient = LinearGradient(
      colors: [Color(0xF0FF5F00), Color(0xFFFFA400), Color(0xFFFFA400)],
    );

    switch (buttonType) {
      case ButtonType.primary:
        effectiveGradient ??= !isDisabled ? defaultPrimaryGradient : null;
        effectiveBackgroundColor = !isDisabled
            ? backgroundColor
            : Colors.black.withValues(alpha: 0.12);

        effectiveForegroundColor =
            foregroundColor ??
            (isDisabled
                ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                : Colors.white);
        effectiveBorder = BorderSide(
          color: isDisabled ? Colors.transparent : Colors.transparent,
        );
      case ButtonType.secondary:
        effectiveBackgroundColor = backgroundColor ?? Colors.transparent;
        effectiveForegroundColor =
            foregroundColor ??
            (isDisabled
                ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                : theme.colorScheme.primary);
        effectiveBorder = BorderSide(
          color: isDisabled
              ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
              : (foregroundColor ?? theme.colorScheme.primary),
        );

      case ButtonType.text:
        effectiveBackgroundColor = backgroundColor ?? Colors.transparent;
        effectiveForegroundColor =
            foregroundColor ??
            (isDisabled
                ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                : theme.colorScheme.primary);
        effectiveBorder = BorderSide(
          color: isDisabled
              ? Colors.black.withValues(alpha: 0.12)
              : (theme.colorScheme.primary),
        );
      case ButtonType.destructive:
        effectiveBackgroundColor =
            backgroundColor ??
            (isDisabled
                ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
                : theme.colorScheme.error);
        effectiveForegroundColor =
            foregroundColor ??
            (isDisabled
                ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                : theme.colorScheme.onError);
    }

    Widget buttonContent;
    if (isLoading) {
      buttonContent = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(effectiveForegroundColor),
        ),
      );
    } else {
      final textWidget = Text(
        label,
        style:
            textStyle?.copyWith(
              color: effectiveForegroundColor,
              fontSize: fontSize ?? 16.sp,
            ) ??
            theme.textTheme.labelLarge?.copyWith(
              fontSize: fontSize ?? 16.sp,
              color: effectiveForegroundColor,
            ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );

      if (icon != null) {
        buttonContent = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            const SizedBox(width: 8),
            Flexible(child: textWidget),
          ],
        );
      } else {
        buttonContent = textWidget;
      }
    }

    return Container(
      width: width,
      height: height ?? 5.6.h,
      decoration: BoxDecoration(
        boxShadow: const [
          // if (buttonType == ButtonType.primary && !isDisabled)
          //   BoxShadow(
          //     color: AppColors.primaryColor.withValues(alpha: 0.5),
          //     offset: const Offset(0, 4),
          //     blurRadius: 8,
          //   ),
        ],
        color: effectiveBackgroundColor,
        gradient: effectiveBackgroundColor == null ? effectiveGradient : null,
        border: effectiveBorder != null
            ? Border.all(
                color: effectiveBorder.color,
                width: effectiveBorder.width,
              )
            : null,
        borderRadius: effectiveBorderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: effectiveBorderRadius,
          splashColor:
              splashColor ??
              (buttonType == ButtonType.primary
                  ? AppColors.primaryColor
                  : theme.splashColor),
          highlightColor: (buttonType == ButtonType.primary
              ? AppColors.primaryColor
              : Colors.transparent),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isDisabled ? 0.6 : 1.0,
                child: buttonContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
