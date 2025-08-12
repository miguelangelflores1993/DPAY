import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/modules/auth/domain/entities/auth_entity.dart';

class UserBloc extends FormGenericBloc<AuthEntity?, NoParams> {
  UserBloc() : super();
}
