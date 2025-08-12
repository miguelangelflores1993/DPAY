part of '{{feature_name.snakeCase()}}_bloc.dart';

abstract class {{feature_name.pascalCase()}}Event extends Equatable {
  const {{feature_name.pascalCase()}}Event();

  @override
  List<Object> get props => [];
}

class GetAll{{feature_name.pascalCase()}}Event extends {{feature_name.pascalCase()}}Event {}
