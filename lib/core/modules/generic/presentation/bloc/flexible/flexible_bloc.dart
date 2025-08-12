import 'package:app/core/modules/generic/presentation/bloc/base/base_event.dart';
import 'package:app/core/modules/generic/presentation/bloc/flexible/flexible_base_state.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

abstract class FlexibleBaseBloc extends Bloc<BaseEvent, FlexibleState> {
  FlexibleBaseBloc(super.initialState);
  FlexibleState loading() {
    return state.copyWith(status: AppStatus.loading);
  }

  FlexibleState success() {
    return state.copyWith(status: AppStatus.success);
  }

  FlexibleState error(CustomException? message) {
    return state.copyWith(status: AppStatus.error, error: () => message);
  }
}
