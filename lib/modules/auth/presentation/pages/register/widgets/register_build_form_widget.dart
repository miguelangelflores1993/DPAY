import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_event.dart';
import 'package:app/core/ui/widgets/molecules/app_form.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:app/modules/auth/presentation/pages/register/bloc/register_bloc.dart';
import 'package:app/modules/auth/presentation/pages/register/widgets/register_content_form_widget.dart';
import 'package:app/modules/auth/presentation/pages/register/widgets/register_header_form_widget.dart';
import 'package:app/shared/components/already_have_account.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';

class RegisterBuildWidget extends StatelessWidget {
  const RegisterBuildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppForm(
      labelSubmitButton: AppStrings.register,
      header: const HeaderRegisterWidget(),
      content: const RegisterContentWidget(),
      footer: const AlreadyHaveAccountWidget(),
      onSubmit: (JSON data) {
        context.read<RegisterBloc>().add(
          SubmitEvent(
            sl<SignUpUseCase>(),
            params: ParamsAuthRegister(
              firstName: data['firstName'] as String,
              lastName: data['lastName'] as String,
              source: 'EGXReloaded',
              email: (data['email'] as String).trim(),
              password: data['password'] as String,
              phone: (data['countryCode'] as String) + (data['phone'] as String),
            ),
          ),
        );
      },
    );
  }
}
