import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/modules/auth/domain/usecases/forgot_password_use_case.dart';

class ForgotPasswordBloc extends FormGenericBloc<bool, ParamsForgotPassword> {
  ForgotPasswordBloc() : super();
}
