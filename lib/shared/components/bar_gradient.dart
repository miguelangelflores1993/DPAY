import 'package:flutter/material.dart';

class DynamicGradientBar extends StatelessWidget {
  const DynamicGradientBar({
    required this.value,
    super.key,
    this.startColor = Colors.orange,
    this.endColor = Colors.orangeAccent,
    this.height = 12.0,
    this.borderRadius,
    this.backgroundColor = const Color.fromARGB(255, 224, 224, 224),
  });
  final double value;
  final Color startColor;
  final Color endColor;
  final double height;
  final BorderRadius? borderRadius;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final clampedValue = value.clamp(0.0, 1.0);
        final progressWidth = constraints.maxWidth * clampedValue;

        return Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: progressWidth,
                  height: height,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      gradient: LinearGradient(colors: [startColor, endColor]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
