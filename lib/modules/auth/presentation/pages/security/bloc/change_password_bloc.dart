import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';

class ChangePasswordBloc extends FormGenericBloc<bool, ParamsChangePassword> {
  ChangePasswordBloc() : super();
}
