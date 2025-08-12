import 'package:app/core/ui/theme/app_input_decoration.dart';
import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AppTextField {
  static FormBuilderTextField _buildFormField({
    required BuildContext context,
    required String name,
    required String labelText,
    String? hintText,
    String? initialValue,
    Key? key,
    bool isRequired = true,
    int? maxLength,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    bool obscureText = false,
    List<FormFieldValidator<String>>? additionalValidators,
    bool isEnabled = true,
    InputDecoration? decoration,
    TextCapitalization? textCapitalization,
    TextInputAction? textInputAction = TextInputAction.done,
  }) {
    return FormBuilderTextField(
      key: key,
      name: name,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      initialValue: initialValue,
      obscureText: obscureText,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      maxLength: maxLength,
      enabled: isEnabled,
      textInputAction: textInputAction,
      decoration:
          decoration ??
          UIInputDecoration.input(
            labelText: isRequired ? labelText.toRequired() : labelText,
            filled: true,
            suffixIcon: suffixIcon,
            hintText: hintText,
          ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        if (isRequired) FormBuilderValidators.required(errorText: AppStrings.requiredField),
        ...?additionalValidators,
      ]),
      style:
          Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(
            fontSize: 16.4.sp,
            decorationThickness: 0,
          ),
    );
  }



  static Widget iconSelector({
    required BuildContext context,
    required String name,
    required Map<String, String> items,
    String? initialValue,
    Key? key,
    bool isRequired = true,
    String topLabelText = '',
    void Function(String?)? onChanged,
  }) {
    return FormBuilderField<String>(
      key: key,
      name: name,
      initialValue: initialValue,
      onChanged: onChanged,
      builder: (FormFieldState<String?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            if (topLabelText.isNotEmpty)
              Text(
                topLabelText,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
              ),
            Row(
              spacing: 15,
              children: items.entries.map((entry) {
                final value = entry.key;
                final iconPath = entry.value;

                return Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      field.didChange(value);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: field.value == value ? const Color(0xFFFF9500) : Colors.transparent,
                        ),
                      ),
                      child: AppAdaptiveImage(
                        iconPath,
                        width: 5.5.w,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  // Campo normal
  static FormBuilderTextField normal({
    required BuildContext context,
    required String name,
    required String labelText,
    Key? key,
    TextInputType? keyboardType,
    String initialValue = '',
  }) {
    return _buildFormField(
      context: context,
      name: name,
      labelText: labelText,
      isRequired: false,
      key: key,
      initialValue: initialValue,
      keyboardType: keyboardType,
    );
  }

  static Widget required({
    required BuildContext context,
    required String name,
    required String labelText,
    String? hintText,
    Key? key,
    TextInputType? keyboardType,
    String initialValue = '',
    List<FormFieldValidator<String>>? additionalValidators,
    TextCapitalization? textCapitalization,
    TextInputAction? textInputAction,
    //maximum number of characters
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          (labelText.isNotEmpty ? labelText.toRequired() : ''),
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
        ),

        _buildFormField(
          context: context,
          name: name,
          labelText: labelText,
          hintText: hintText,
          key: key,
          initialValue: initialValue,
          keyboardType: keyboardType,
          additionalValidators: additionalValidators,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          maxLength: maxLength,
        ),
      ],
    );
  }

  static Widget password({
    required BuildContext context,
    required String name,
    required String labelText,
    String? hintText,
    Key? key,
    String initialValue = '',
    bool isRequired = true,
    int maxLength = 64,
    List<FormFieldValidator<String>>? additionalValidators,
    TextInputAction? textInputAction,
  }) {
    final obscureTextNotifier = ValueNotifier<bool>(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.toRequired(),
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
        ),

        const SizedBox(height: 8),
        ValueListenableBuilder<bool>(
          valueListenable: obscureTextNotifier,
          builder: (context, obscureText, _) {
            return _buildFormField(
              context: context,
              name: name,
              labelText: labelText,
              hintText: hintText,
              key: key,
              initialValue: initialValue,
              isRequired: isRequired,
              maxLength: maxLength,
              obscureText: obscureText,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: textInputAction,
              suffixIcon: IconButton(
                icon: AppAdaptiveImage(
                  obscureText ? AppImages.visibilityOff : AppImages.visibility,
                ),
                onPressed: () => obscureTextNotifier.value = !obscureText,
              ),
              additionalValidators: additionalValidators,
            );
          },
        ),
      ],
    );
  }

  // Campo de teléfono
  static FormBuilderTextField phone({
    required BuildContext context,
    required String name,
    required String labelText,
    String initialValue = '',
    bool isRequired = true,
  }) {
    return _buildFormField(
      context: context,
      name: name,
      labelText: labelText,
      initialValue: initialValue,
      isRequired: isRequired,
      keyboardType: TextInputType.phone,
      additionalValidators: [
        FormBuilderValidators.minLength(
          8,
          checkNullOrEmpty: !isRequired,
          errorText: 'Check your phone number',
        ),
      ],
    );
  }

  static List<String? Function(String?)> buildPasswordValidators({String? oldPassword}) {
    final isNewPassword = oldPassword != null && oldPassword.trim().isNotEmpty;

    return [
      // No puede estar vacía
      (String? value) {
        if (value == null || value.trim().isEmpty) {
          return AppStrings.passwordEmpty;
        }
        return null;
      },

      if (isNewPassword) ...[
        // Mínimo 8 caracteres
        (String? value) {
          if (value != null && value.length < 8) {
            return AppStrings.passwordMinLength;
          }
          return null;
        },

        // Máximo 20 caracteres
        (String? value) {
          if (value != null && value.length > 20) {
            return AppStrings.passwordMaxLength;
          }
          return null;
        },

        // Al menos una minúscula
        (String? value) {
          if (value != null && !RegExp('[a-z]').hasMatch(value)) {
            return AppStrings.passwordLowerCase;
          }
          return null;
        },

        // Al menos una mayúscula
        (String? value) {
          if (value != null && !RegExp('[A-Z]').hasMatch(value)) {
            return AppStrings.passwordUpperCase;
          }
          return null;
        },

        // Al menos un dígito o carácter especial
        (String? value) {
          if (value != null && !RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>_\-+=]').hasMatch(value)) {
            return AppStrings.passwordDigitOrSpecial;
          }
          return null;
        },

        // No puede ser igual a la contraseña anterior
        (String? value) {
          if (value != null && value == oldPassword) {
            return AppStrings.passwordSameAsOld;
          }
          return null;
        },
      ],
    ];
  }

  static List<String? Function(String?)> buildEmailValidators() {
    return [
      (String? value) {
        if (value == null || value.trim().isEmpty) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null && value.trim().length < 7) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null && value.length > 254) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null && (value.startsWith('.') || value.endsWith('.'))) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null && value.contains('..')) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null && RegExp(r'[",#\$%&/\\*\s]').hasMatch(value)) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null && !value.contains('@')) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null &&
            !RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+\+?[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
            ).hasMatch(value)) {
          return AppStrings.emailInvalidEmail;
        }
        return null;
      },

      (String? value) {
        if (value != null) {
          final domain = value.split('@').length > 1 ? value.split('@')[1] : '';
          final tld = domain.split('.').last;
          if (tld.length < 2 || !RegExp(r'^[a-zA-Z]+$').hasMatch(tld)) {
            return AppStrings.emailInvalidEmail;
          }
        }
        return null;
      },
    ];
  }

  static List<String? Function(String?)> buildNameValidators() {
    return [
      (String? value) {
        if (value == null || value.isEmpty) {
          return AppStrings.nameEmpty;
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty) {
          final nameRegExp = RegExp(r'^[a-zA-ZñÑáÁéÉíÍóÓúÚüÜ\s]+$');
          if (!nameRegExp.hasMatch(value)) {
            return AppStrings.nameInvalidChars;
          }
        }
        return null; // No hay error
      },
    ];
  }

  static List<String? Function(String?)> buildLastNameValidators() {
    return [
      (String? value) {
        if (value == null || value.isEmpty) {
          return AppStrings.lastNameEmpty;
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty) {
          final nameRegExp = RegExp(r'^[a-zA-ZñÑáÁéÉíÍóÓúÚüÜ\s]+$');
          if (!nameRegExp.hasMatch(value)) {
            return AppStrings.nameInvalidChars;
          }
        }
        return null; // No hay error
      },
    ];
  }

  static List<String? Function(String?)> buildPhoneNumberValidators() {
    return [
      (String? value) {
        if (value == null || value.isEmpty) {
          return AppStrings.phoneEmpty;
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty) {
          final digitsOnlyRegExp = RegExp(r'^\d+$');
          if (!digitsOnlyRegExp.hasMatch(value)) {
            return AppStrings.phoneOnlyDigits;
          }
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty) {
          final specialCharsRegExp = RegExp(r'[^\d]');
          if (specialCharsRegExp.hasMatch(value)) {
            return AppStrings.phoneNoSpacesSpecialChars;
          }
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty && value.length != 8) {
          return AppStrings.phoneInvalidLength;
        }
        return null; // No error
      },
    ];
  }

  static List<String? Function(String?)> buildDocumentNumberValidators() {
    return [
      (String? value) {
        if (value == null || value.isEmpty) {
          return AppStrings.documentNumberEmpty;
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty) {
          final digitsOnlyRegExp = RegExp(r'^[0-9]+$');
          if (!digitsOnlyRegExp.hasMatch(value)) {
            return AppStrings.documentNumberDigitsOnly;
          }
        }
        return null; // No error
      },

      (String? value) {
        if (value != null && value.isNotEmpty) {
          if (value.length < 7 || value.length > 10) {
            return AppStrings.documentNumberInvalidLength;
          }
        }
        return null; // No error
      },
    ];
  }

  // Campo de email
  static FormBuilderTextField email({
    required BuildContext context,
    required String name,
    required String labelText,
    Key? key,
    String initialValue = '',
    bool isRequired = true,
  }) {
    return _buildFormField(
      context: context,
      name: name,
      labelText: labelText,
      key: key,
      initialValue: initialValue,
      isRequired: isRequired,
      keyboardType: TextInputType.emailAddress,
      additionalValidators: [
        (value) {
          if (value?.isNotEmpty != true) return null;
          final emailValid = RegExp(
            r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+",
          ).hasMatch(value!);
          if (!emailValid) {
            return 'Check your email address';
          }
          return null;
        },
      ],
    );
  }

  // Campo de nota
  static FormBuilderTextField note({
    required BuildContext context,
    required String name,
    required String labelText,
    int maxLine = 5,
    String initialValue = '',
    int maxLength = 1000,
    Key? key,
    bool isRequired = false,
  }) {
    return _buildFormField(
      context: context,
      name: name,
      labelText: labelText,
      initialValue: initialValue,
      key: key,
      maxLength: maxLength,
      isRequired: isRequired,
    );
  }

  static Widget date({
    required BuildContext context,
    required String name,
    required String topLabelText,
    String? hintText,
    DateTime? initialValue,
    bool isRequired = true,
    Key? key,
    DateTime? firstDate,
    DateTime? lastDate,
    InputType inputType = InputType.date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topLabelText,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
        ),
        const SizedBox(height: 8),
        FormBuilderDateTimePicker(
          key: key,
          name: name,
          initialValue: initialValue,
          inputType: inputType,

          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? DateTime.now(),
          format: inputType == InputType.date ? DateFormat('dd/MM/yyyy') : DateFormat('dd/MM/yyyy HH:mm'),

          decoration:
              UIInputDecoration.input(
                labelText: hintText ?? topLabelText,
                filled: true,
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 2.w),
                  child: Transform.scale(
                    scale: 0.125.w,
                    child: const AppAdaptiveImage(
                      AppImages.calendar,
                    ),
                  ),
                ),

                hintText: hintText ?? topLabelText,
              ).copyWith(
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 16.sp,
                  color: const Color(0xFF6B6C7E),
                ),
              ),
          validator: FormBuilderValidators.compose([
            if (isRequired)
              FormBuilderValidators.required(
                errorText: 'El campo es requerido',
              ),
          ]),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  static Widget selector<T>({
    required BuildContext context,
    required String name,
    required String topLabelText,
    required List<T>? items,
    required String Function(T value) itemLabelBuilder,
    double? width,
    double? iconWidth,
    Color? iconColor,
    String? hintText,
    T? initialValue,
    bool isRequired = true,
    InputDecoration? decoration,
    TextStyle? textStyle,
    AlignmentGeometry? alignment,
    DropdownMenuItem<T>? extraOption,
    Widget? menuIcon,
    void Function(T?, String)? onChanged,
    EdgeInsetsGeometry? paddingSelectedItem,
    Key? key,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          if (topLabelText.isNotEmpty)
            Text(
              topLabelText,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
            ),
          FormBuilderDropdown<T>(
            key: key,
            name: name,
            initialValue: initialValue,
            onChanged: (value) => onChanged?.call(value, name),
            icon: AppAdaptiveImage(
              AppImages.dropdown,
              width: iconWidth ?? 5.w,
              colorFilter: iconColor != null ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
            ),
            alignment: alignment ?? AlignmentDirectional.centerStart,
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Colors.white,
            items: [
              ...(items ?? []).map(
                (entry) => DropdownMenuItem<T>(
                  value: entry,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      if (menuIcon != null) menuIcon,
                      Expanded(
                        child: Text(
                          itemLabelBuilder(entry),
                          style:
                              textStyle ??
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 15.6.sp,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (extraOption != null) extraOption,
            ],
            decoration:
                decoration ??
                UIInputDecoration.input(
                  labelText: hintText ?? topLabelText,
                  filled: true,
                ).copyWith(
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xFF6B6C7E),
                  ),
                ),
            hint: Text(
              hintText ?? 'Selecciona una opción',
              style:
                  textStyle ??
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B6C7E),
                  ),
            ),
            validator: isRequired
                ? FormBuilderValidators.required(
                    errorText: 'El campo es requerido',
                  )
                : null,
            style:
                textStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }

  static Widget countryPicker<T>({
    required BuildContext context,
    required String name,
    required String topLabelText,
    required Map<T, T>? items,
    required String Function(T value) itemLabelBuilder,
    double? width,
    double? iconWidth,
    Color? iconColor,
    String? hintText,
    T? initialValue,
    bool isRequired = true,
    InputDecoration? decoration,
    TextStyle? textStyle,
    AlignmentGeometry? alignment,
    DropdownMenuItem<T>? extraOption,
    Widget? menuIcon,
    void Function(T?, String)? onChanged,
    EdgeInsetsGeometry? paddingSelectedItem,
    Key? key,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          if (topLabelText.isNotEmpty)
            Text(
              topLabelText,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
            ),
          FormBuilderDropdown<T>(
            key: key,
            name: name,
            initialValue: initialValue,
            onChanged: (value) => onChanged?.call(value, name),
            icon: AppAdaptiveImage(
              AppImages.dropdown,
              width: iconWidth ?? 5.w,
              colorFilter: iconColor != null ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
            ),
            alignment: alignment ?? AlignmentDirectional.centerStart,
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Colors.white,
            items: [
              ...(items?.entries.map(
                    (entry) {
                      return DropdownMenuItem<T>(
                        value: entry.key,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (menuIcon != null) menuIcon,

                            AppAdaptiveImage(
                              entry.value.toString(),
                              width: 6.w,
                            ),

                            Text(
                              itemLabelBuilder(entry.key),
                              style:
                                  textStyle ??
                                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ) ??
                  []),
              if (extraOption != null) extraOption,
            ],
            decoration:
                decoration ??
                UIInputDecoration.input(
                  labelText: hintText ?? topLabelText,
                  filled: true,
                ).copyWith(
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xFF6B6C7E),
                  ),
                ),
            hint: Text(
              hintText ?? 'Selecciona una opción',
              style:
                  textStyle ??
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B6C7E),
                  ),
            ),
            validator: isRequired
                ? FormBuilderValidators.required(
                    errorText: 'El campo es requerido',
                  )
                : null,
            style:
                textStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}

extension _Required on String {
  String toRequired() => this /* + ' *' */;
}
