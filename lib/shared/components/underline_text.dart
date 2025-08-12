import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UnderlineText extends StatelessWidget {
  const UnderlineText(
    this.text, {
    this.spacing = 2,
    this.style,
    this.underlineColor = Colors.black,
    this.marginTop = true,
    super.key,
  });

  final String text;
  final double spacing;
  final TextStyle? style;
  final Color underlineColor;
  final bool marginTop;

  double _getTextWidth(BuildContext context, TextStyle style) {
    final media = MediaQuery.of(context);
    final base = DefaultTextStyle.of(context).style;
    final merged = base.merge(style);

    final painter = TextPainter(
      text: TextSpan(text: text, style: merged),
      textDirection: Directionality.of(context),
      locale: Localizations.localeOf(context),
      textScaler: media.textScaler,
      maxLines: 1,
    )..layout();

    // ⇢ redondeo al pixel físico para evitar cortes
    final dpr = media.devicePixelRatio;
    final exact = (painter.width * dpr).ceil() / dpr;
    return exact;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveStyle =
        style ??
        TextStyle(
          fontSize: 15.6.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF7C8BA0),
          height: 0.85,
        );

    final textWidth = _getTextWidth(context, effectiveStyle);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (marginTop) const SizedBox(height: 5),
        Text(text, style: effectiveStyle),
        SizedBox(height: spacing),
        Container(
          width: textWidth,
          height: 1,
          color: underlineColor,
        ),
      ],
    );
  }
}
