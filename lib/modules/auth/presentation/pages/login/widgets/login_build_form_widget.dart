import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_event.dart';
import 'package:app/core/ui/widgets/molecules/molecules.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:app/modules/auth/presentation/pages/login/widgets/login_content_form_widget.dart';
import 'package:app/modules/auth/presentation/pages/login/widgets/login_footer_form_widget.dart';
import 'package:app/modules/auth/presentation/pages/login/widgets/login_header_form_widget.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginInitWidget extends StatelessWidget {
  const LoginInitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppForm(
      header: const LoginHeaderWidget(),
      content: const LoginContentWidget(),
      footer: const LoginFooterWidget(),
      labelSubmitButton: AppStrings.signIn,
      onSubmit: (data) {
        context.read<LoginBloc>().add(
          SubmitEvent(
            sl<SignInUseCase>(),
            params: ParamsAuthLogin(
              email: data['email'] as String,
              password: data['password'] as String,
            ),
          ),
        );
      },
    );
  }
}
