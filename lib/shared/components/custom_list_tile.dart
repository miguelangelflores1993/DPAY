import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.title,
    required this.onTap,
    super.key,
    this.textStyle,
    this.trailingWidget,
    this.leadingWidget,
    this.needDivider = true,
    this.needsBorder = BorderRadius.zero,
    this.margin = 0,
  });
  final String title;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  // tamanos

  final Widget? trailingWidget;
  final Widget? leadingWidget;
  final bool needDivider;
  final BorderRadiusGeometry? needsBorder;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: needsBorder,
            color: Colors.transparent,
            child: ListTile(
              leading: leadingWidget,
              minLeadingWidth: 0,

              title: Text(
                title,
                style:
                    textStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              trailing: (trailingWidget == null)
                  ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black.withValues(alpha: 0.5),
                      size: 20,
                    )
                  : trailingWidget,
              onTap: onTap,
            ),
          ),
        ),
        if (needDivider)
          Divider(
            height: 1,
            color: const Color(0xFFC1C1C1),
            thickness: 0.5,
            indent: margin,
            endIndent: margin,
          ),
      ],
    );
  }
}
