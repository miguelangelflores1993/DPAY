import 'package:app/core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class PinputFormField extends StatelessWidget {
  const PinputFormField({required this.name, super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorStyle =
        theme.inputDecorationTheme.errorStyle ??
        theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.error);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 70,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAEFF5)),
      ),
    );
    return FormBuilderField<String>(
      name: name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: 'El código no puede estar vacío',
        ),
        FormBuilderValidators.minLength(
          6,
          errorText: 'El código debe tener 6 dígitos',
        ),
      ]),
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pinput(
              length: 6,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: AppColors.primaryColor),
                ),
              ),
              onChanged: field.didChange,
              defaultPinTheme: defaultPinTheme,
              errorText: field.errorText,
            ),

            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(field.errorText!, style: errorStyle),
              ),
          ],
        );
      },
    );
  }
}
