import 'package:flutter/material.dart';

class StrikethroughText extends StatelessWidget {
  const StrikethroughText({
    required this.text,
    super.key,
    this.style,
    this.lineColor = Colors.black,
    this.lineHeight = 1.0,
    this.textAlign = TextAlign.start,
    this.lineWidth,
  });
  final String text;
  final TextStyle? style;
  final Color lineColor;
  final double lineHeight;
  final TextAlign textAlign;
  final double? lineWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          textAlign: textAlign,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        return Stack(
          alignment: Alignment.center,
          children: [
            Text(text, style: style, textAlign: textAlign),
            Container(height: lineHeight, width: textPainter.size.width, color: lineColor),
          ],
        );
      },
    );
  }
}
