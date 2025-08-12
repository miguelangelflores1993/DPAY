import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectorWidget extends StatelessWidget {
  const SelectorWidget({
    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
    super.key,
    this.spacing = 10.0,
    this.textStyle,
    this.wrapAlignment = WrapAlignment.start,
  });

  final Map<String, String> options;
  final List<String> selectedOptions;
  final ValueChanged<List<String>> onSelectionChanged;
  final double spacing;
  final TextStyle? textStyle;
  final WrapAlignment wrapAlignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: wrapAlignment,
        runSpacing: spacing,
        spacing: spacing,
        children: options.entries.map((entry) {
          final key = entry.key;
          final value = entry.value;
          final isSelected = selectedOptions.contains(key);
          return GestureDetector(
            onTap: () {
              final newSelection = List<String>.from(selectedOptions);
              isSelected ? newSelection.remove(key) : newSelection.add(key);
              onSelectionChanged(newSelection);
            },
            child: InterestOption(
              key: ValueKey(key),
              text: value,
              isSelected: isSelected,
              textStyle: textStyle,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class InterestOption extends StatelessWidget {
  const InterestOption({
    required this.text,
    this.isSelected = false,
    this.textStyle,
    super.key,
  });

  final String text;
  final bool isSelected;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFFFF7622) : Colors.transparent,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: isSelected ? 1 : 0,
            child: Column(
              children: [
                Icon(Icons.check, color: const Color(0xFFFF7622), size: 5.w),
              ],
            ),
          ),

          Text(
            text,
            textAlign: TextAlign.center,
            style:
                textStyle ??
                TextStyle(fontSize: 15.5.sp, color: const Color(0xFF181725)),
          ),
        ],
      ),
    );
  }
}
