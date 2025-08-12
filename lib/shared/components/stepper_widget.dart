import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
    this.text,
    super.key,
    this.min = 0,
    this.max = 10,
    this.counterBgColor = Colors.white,
    this.textColor = const Color(0xFF181725),
  });

  final String? text;
  final num count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;
  final num min;
  final num max;
  final Color? counterBgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return text == null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (count == 1) {
                    onDelete.call();
                    return;
                  }
                  if (count <= 1) return;
                  onDecrement.call();
                },
                style: IconButton.styleFrom(
                  overlayColor: Colors.black.withValues(alpha: 0.2),
                ),
                icon: count == 1 ? AppAdaptiveImage(AppImages.trash, width: 5.w) : const Icon(Icons.remove),
                color: count <= min ? const Color(0xFFB3B3B3) : textColor,
                iconSize: 5.w,
              ),
              Container(
                width: 10.5.w,
                height: 10.5.w,
                decoration: BoxDecoration(
                  color: counterBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    count.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: count < max ? onIncrement : null,
                style: IconButton.styleFrom(
                  overlayColor: Colors.black.withValues(alpha: 0.2),
                ),
                icon: const Icon(Icons.add),
                color: count >= max ? const Color(0xFFB3B3B3) : textColor,
                iconSize: 5.w,
              ),
            ],
          )
        : Column(
            spacing: 8,
            children: [
              Text(text!, style: TextStyle(fontSize: 16.sp)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: count > min ? onDecrement : null,
                    style: IconButton.styleFrom(
                      overlayColor: Colors.black.withValues(alpha: 0.2),
                    ),
                    icon: const Icon(Icons.remove),
                    color: count <= min ? const Color(0xFFB3B3B3) : textColor,
                    iconSize: 5.w,
                  ),
                  Container(
                    width: 10.5.w,
                    height: 10.5.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        count.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: count < max ? onIncrement : null,
                    style: IconButton.styleFrom(
                      foregroundColor: count >= max ? const Color(0xFFB3B3B3) : textColor,
                      overlayColor: Colors.black.withValues(alpha: 0.2),
                    ),
                    icon: const Icon(Icons.add),
                    color: count >= max ? const Color(0xFFB3B3B3) : textColor,
                    iconSize: 5.w,
                  ),
                ],
              ),
            ],
          );
  }
}
