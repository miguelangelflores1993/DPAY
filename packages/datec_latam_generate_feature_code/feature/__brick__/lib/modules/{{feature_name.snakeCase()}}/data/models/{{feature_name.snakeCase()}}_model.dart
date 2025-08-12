import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{feature_name.pascalCase()}}Model extends {{feature_name.pascalCase()}} {
  {{feature_name.pascalCase()}}Model({
    required super.id,
  });

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => {{feature_name.pascalCase()}}Model(
        id: json['id'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}