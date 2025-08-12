import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';
import 'package:app/modules/auth/domain/usecases/sign_up_use_case.dart';

class RegisterBloc extends FormGenericBloc<AuthEntity, ParamsAuthRegister> {
  RegisterBloc() : super();
}
