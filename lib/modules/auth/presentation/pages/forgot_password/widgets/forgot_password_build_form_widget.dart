import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc_screen.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_event.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/core/ui/widgets/molecules/app_form.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:app/modules/auth/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:app/modules/auth/presentation/pages/forgot_password/widgets/forgot_password_content_form_widget.dart';
import 'package:app/modules/auth/presentation/pages/forgot_password/widgets/forgot_password_header_form_widget.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';

class ForgotPasswordBuildFormWidget extends FormGenericBlocPage<ForgotPasswordBloc, bool, ParamsForgotPassword> {
  ForgotPasswordBuildFormWidget({super.key})
    : super(bloc: sl<ForgotPasswordBloc>(), wrapWithScaffold: false, isForm: false);

  @override
  void onListener(BuildContext context, FormBaseState<bool> state) {
    super.onListener(context, state);
    if (state.isLoading) {
      EasyLoading.show(status: AppStrings.loading);
    } else if (state.isSuccess) {
      EasyLoading.show(status: AppStrings.successForgotPassword);
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          EasyLoading.dismiss();
          if (!context.mounted) return;
          context.go('/login');
        },
      );
    }
  }

  @override
  Widget builder(BuildContext context, FormBaseState<bool> state) {
    return AppForm(
      customPadding: EdgeInsets.zero,
      header: const ForgotPasswordHeaderFormWidget(),
      content: const ForgotPasswordContentFormWidget(),
      labelSubmitButton: AppStrings.sendInstructions,
      onSubmit: (JSON data) {
        context.read<ForgotPasswordBloc>().add(
          SubmitEvent(
            sl<ForgotPasswordUseCase>(),
            params: ParamsForgotPassword(
              email: data['email'] as String,
            ),
          ),
        );
      },
    );
  }
}
