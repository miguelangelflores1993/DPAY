import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc_screen.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/presentation/pages/security/bloc/change_password_bloc.dart';
import 'package:app/modules/auth/presentation/pages/security/widgets/change_password_build_form_widget.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends FormGenericBlocPage<ChangePasswordBloc, bool, ParamsChangePassword> {
  ChangePasswordPage({super.key}) : super(bloc: sl<ChangePasswordBloc>());

  @override
  Widget builder(BuildContext context, FormBaseState<bool> state) {
    return const ChangePasswordInitWidget();
  }

  @override
  Future<void> onSubmitSuccess(BuildContext context, FormBaseState<bool> state, {String? message}) async {
    await super.onSubmitSuccess(
      context,
      state,
      message: AppStrings.successChangePassword,
    );
  }

  @override
  void onNavigateSuccess(BuildContext context) {
    context.pop();
  }
}
