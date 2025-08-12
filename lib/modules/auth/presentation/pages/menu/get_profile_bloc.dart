import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/modules/auth/data/models/user_model.dart';
import 'package:app/modules/auth/domain/usecases/get_profile_use_case.dart';

class GetProfileBloc extends FormGenericBloc<UserModel?, ParamsGetProfile> {
  GetProfileBloc() : super();
}
