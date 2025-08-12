import 'package:app/core/ui/widgets/atoms/checkbox/app_checkbox.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TermsAndPrivacyWidget extends StatefulWidget {
  const TermsAndPrivacyWidget({
    required this.isChecked,
    super.key,
    this.termsUrl,
    this.privacyUrl,
    this.onChanged,
  });

  final String? termsUrl;
  final String? privacyUrl;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  @override
  State<TermsAndPrivacyWidget> createState() => _TermsAndPrivacyWidgetState();
}

class _TermsAndPrivacyWidgetState extends State<TermsAndPrivacyWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Flexible(
          child: AppCheckbox(
            name: 'name',
            validator: (value) {
              if (value == null || value == false) {
                return 'Es necesario aceptar los terminos y condiciones';
              }
              return null;
            },

            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontSize: 15.sp),
                children: [
                  TextSpan(text: AppStrings.termsPrefix),
                  TextSpan(
                    text: AppStrings.termsInitial,
                    style: const TextStyle(color: Color(0xFFF47C2C)),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(text: AppStrings.termsMiddle),
                  TextSpan(
                    text: AppStrings.termsPrivacy,
                    style: const TextStyle(color: Color(0xFFF47C2C)),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
              filled: false,
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
