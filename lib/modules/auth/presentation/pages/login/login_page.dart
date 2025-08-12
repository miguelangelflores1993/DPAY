import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc_screen.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';
import 'package:app/modules/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:app/modules/auth/presentation/pages/login/widgets/login_build_form_widget.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends FormGenericBlocPage<LoginBloc, AuthEntity, ParamsAuthLogin> {
  LoginPage({super.key}) : super(bloc: sl<LoginBloc>(), isForm: false);

  @override
  Widget builder(BuildContext context, FormBaseState<AuthEntity> state) {
    return const LoginInitWidget();
  }

  @override
  Future<void> onSubmitSuccess(BuildContext context, FormBaseState<AuthEntity> state, {String? message}) async {
    await super.onSubmitSuccess(context, state, message: AppStrings.successLogin);
  }

  @override
  void onNavigateSuccess(BuildContext context) {
    context.pushReplacementNamed('home');
  }
}
