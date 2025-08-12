import 'package:app/core/common/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/usecases/get_all_{{feature_name.snakeCase()}}_use_case.dart';
import 'package:app/core/common/repository_base.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import '../../domain/usecases/get_{{feature_name.snakeCase()}}_by_id_use_case.dart';
import '../../domain/usecases/create_{{feature_name.snakeCase()}}_use_case.dart';

part '{{feature_name.snakeCase()}}_event.dart';
part '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc({
    required this.getAll{{feature_name.pascalCase()}}UseCase, 
    required this.get{{feature_name.pascalCase()}}UseCase, 
    required this.create{{feature_name.pascalCase()}}UseCase})

      : super(Concrete{{feature_name.pascalCase()}}State.initial()) {
    on<GetAll{{feature_name.pascalCase()}}Event>((event, emit) async {
      emit(state.copyWith(status: AppStatus.loading));

      final result = await getAll{{feature_name.pascalCase()}}UseCase(NoParams());

      result.fold(
        (error) => emit(state.copyWith(exception: () => error)),
        (response) => emit(state.copyWith(
          {{feature_name.camelCase()}}: response,
          status: AppStatus.success,
          exception: () => null,
        )),
      );
    });
  }

  final GetAll{{feature_name.pascalCase()}}UseCase getAll{{feature_name.pascalCase()}}UseCase;
  final Get{{feature_name.pascalCase()}}UseCase get{{feature_name.pascalCase()}}UseCase;
  final Create{{feature_name.pascalCase()}}UseCase create{{feature_name.pascalCase()}}UseCase;
}