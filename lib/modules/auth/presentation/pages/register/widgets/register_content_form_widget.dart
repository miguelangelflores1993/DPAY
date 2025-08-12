import 'package:app/core/ui/widgets/atoms/textfield/app_text_field.dart';
import 'package:app/shared/components/terms_privacy.dart';
import 'package:app/shared/constants/country_flags.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterContentWidget extends StatelessWidget {
  const RegisterContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              AppTextField.required(
                context: context,
                hintText: AppStrings.hintName,
                name: 'firstName',
                labelText: AppStrings.name,
                keyboardType: TextInputType.text,

                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
              ),
              AppTextField.required(
                labelText: AppStrings.lastName,
                hintText: AppStrings.hintLastname,
                context: context,
                name: 'lastName',
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
              ),

              AppTextField.required(
                labelText: AppStrings.email,
                hintText: AppStrings.hintEmail,
                keyboardType: TextInputType.emailAddress,
                context: context,
                name: 'email',
                additionalValidators: AppTextField.buildEmailValidators(),
                textInputAction: TextInputAction.next,
              ),

              AppTextField.password(
                context: context,
                hintText: AppStrings.hintPassword,
                name: 'password',
                labelText: AppStrings.password,
              ),
              SizedBox(
                height: 11.5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: AppTextField.countryPicker(
                        context: context,
                        hintText: AppStrings.phone,
                        name: 'countryCode',
                        topLabelText: AppStrings.phone,
                        items: countryFlags,
                        itemLabelBuilder: (value) => value,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: AppTextField.required(
                          context: context,
                          hintText: AppStrings.hintPhone,
                          name: 'phone',
                          keyboardType: TextInputType.phone,
                          labelText: '',
                          additionalValidators: AppTextField.buildPhoneNumberValidators(),
                          maxLength: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Text(
          AppStrings.passwordValidation,
          style: TextStyle(fontSize: 15.sp, color: const Color(0xFF7C8BA0)),
        ),

        TermsAndPrivacyWidget(
          isChecked: true,
          onChanged: (value) {},
          termsUrl: 'https://elgeniox.com/terminos-y-condiciones-cliente-usuario',
          privacyUrl: 'https://elgeniox.com/terminos-y-condiciones-cliente-usuario',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
