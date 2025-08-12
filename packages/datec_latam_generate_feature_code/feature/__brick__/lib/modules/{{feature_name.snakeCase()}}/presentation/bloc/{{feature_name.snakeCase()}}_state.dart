part of '{{feature_name.snakeCase()}}_bloc.dart';

abstract class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State({
    required this.{{feature_name.camelCase()}},
    required this.exception,
    required this.status,
  });

  const {{feature_name.pascalCase()}}State.initial()
      : {{feature_name.camelCase()}} = const [],
        exception = null,
        status = AppStatus.initial;

  final List<{{feature_name.pascalCase()}}> {{feature_name.camelCase()}};
  final CustomException? exception;
  final AppStatus status;

  {{feature_name.pascalCase()}}State copyWith({
    AppStatus? status,
    List<{{feature_name.pascalCase()}}> ?{{feature_name.camelCase()}},
    CustomException? Function()? exception,
  }) {
    return Concrete{{feature_name.pascalCase()}}State(
      status: status ?? this.status,
      {{feature_name.camelCase()}}: {{feature_name.camelCase()}} ?? this.{{feature_name.camelCase()}},
      exception: exception != null ? exception() : this.exception,
    );
  }

  @override
  List<Object?> get props => [{{feature_name.camelCase()}}, status, exception];
}

class Concrete{{feature_name.pascalCase()}}State extends {{feature_name.pascalCase()}}State {
  const Concrete{{feature_name.pascalCase()}}State({
    required super.{{feature_name.camelCase()}},
    required super.exception,
    required super.status,
  }) : super();
  
  Concrete{{feature_name.pascalCase()}}State.initial() : super.initial();
}
