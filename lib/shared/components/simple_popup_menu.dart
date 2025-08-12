import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SimplePopupMenu extends StatelessWidget {
  const SimplePopupMenu({
    required this.options,
    required this.onSelected,
    required this.child,
    this.needsDivider = false,
    this.offset = Offset.zero,
    this.widthMenu,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });
  final List<MenuOption> options;
  final void Function(String value) onSelected;
  final Widget child;
  final bool needsDivider;
  final Offset offset;
  final double? widthMenu;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: '',
      onSelected: onSelected,
      offset: offset,
      menuPadding: EdgeInsets.zero,
      constraints: (widthMenu != null) ? BoxConstraints(maxWidth: widthMenu!) : null,
      itemBuilder: (BuildContext context) {
        final menuEntries = <PopupMenuEntry<String>>[];

        for (var i = 0; i < options.length; i++) {
          final option = options[i];
          menuEntries.add(
            PopupMenuItem<String>(
              value: option.value,
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: SizedBox(
                width: (widthMenu != null) ? widthMenu! : null,
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  spacing: 5,
                  children: [
                    if (option.image != null) ...[
                      AppAdaptiveImage(
                        option.image!,
                        width: 4.5.w,
                        height: 4.5.w,
                      ),
                    ],

                    Text(option.label),
                    if (option.iconRight != null) ...[
                      option.iconRight!,
                    ],
                  ],
                ),
              ),
            ),
          );

          if (needsDivider && i < options.length - 1) {
            menuEntries.add(
              const PopupMenuDivider(
                color: Color(0xFFE7E7ED),
                height: 1,
                thickness: 1,
                indent: 12,
                endIndent: 12,
              ),
            );
          }
        }
        return menuEntries;
      },

      child: child,
    );
  }
}

class MenuOption {
  const MenuOption({
    required this.value,
    required this.label,
    this.image,
    this.iconRight,
  });
  final String value;
  final String label;
  final String? image;
  final Widget? iconRight;
}
