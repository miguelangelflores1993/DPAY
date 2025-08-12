import 'package:app/core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class AppCheckbox extends FormBuilderFieldDecoration<bool> {
  AppCheckbox({
    required super.name,
    required this.title,
    super.key,
    super.validator,

    super.initialValue = false,
    super.decoration = const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      isDense: true,
      contentPadding: EdgeInsets.zero,
    ),
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    this.shouldRequestFocus = false,
    Color? backgroundColor,
    //filled
    bool filled = true,
  }) : super(
         builder: (FormFieldState<bool?> field) {
           final state = field as FormBuilderCheckboxState;
           return InputDecorator(
             decoration: state.decoration.copyWith(
               // fondo blanco
               filled: filled,
               fillColor: backgroundColor ?? const Color(0xfff6f6f6),
               isDense: true,
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   width: 24,
                   height: 24,
                   child: Checkbox(
                     side: state.value == null || state.value == false
                         ? const BorderSide(
                             color: Color(0XFF6B6C7E),
                             width: 1.25,
                           )
                         : const BorderSide(
                             color: AppColors.primaryAccentColor,
                             width: 1.25,
                           ),
                     value: state.value ?? false,

                     // cambiar borde
                     fillColor: WidgetStateProperty.resolveWith<Color>((
                       Set<WidgetState> states,
                     ) {
                       if (states.contains(WidgetState.selected)) {
                         return AppColors.primaryColor;
                       }
                       if (states.contains(WidgetState.error)) {
                         return AppColors.errorColor;
                       }

                       return Colors.white;
                     }),

                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(4),
                     ),

                     onChanged: state.enabled ? state.didChange : null,
                   ),
                 ),
                 SizedBox(width: 1.w),
                 Expanded(child: title),
               ],
             ),
           );
         },
       );
  final Widget title;

  final bool shouldRequestFocus;

  @override
  FormBuilderCheckboxState createState() => FormBuilderCheckboxState();
}

class FormBuilderCheckboxState extends FormBuilderFieldDecorationState<AppCheckbox, bool> {
  void handleFocusChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    effectiveFocusNode.addListener(handleFocusChange);
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(handleFocusChange);
    super.dispose();
  }

  @override
  void didChange(bool? value) {
    focus();
    super.didChange(value);
  }
}
