import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/usecases/sign_in_use_case.dart';

class LoginBloc extends FormGenericBloc<AuthEntity, ParamsAuthLogin> {
  LoginBloc() : super();
}
