import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc_screen.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:app/modules/auth/presentation/pages/register/bloc/register_bloc.dart';
import 'package:app/modules/auth/presentation/pages/register/widgets/register_build_form_widget.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends FormGenericBlocPage<RegisterBloc, AuthEntity, ParamsAuthRegister> {
  RegisterPage({super.key}) : super(bloc: sl<RegisterBloc>(), isForm: false);

  @override
  Widget builder(BuildContext context, FormBaseState<AuthEntity> state) {
    return const RegisterBuildWidget();
  }

  @override
  Future<void> onSubmitSuccess(BuildContext context, FormBaseState<AuthEntity> state, {String? message}) async {
    await super.onSubmitSuccess(context, state, message: AppStrings.successRegister);
  }

  @override
  void onNavigateSuccess(BuildContext context) {
    context.go('/otp');
  }
}
