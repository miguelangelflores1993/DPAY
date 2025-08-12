import 'package:equatable/equatable.dart';

class {{feature_name.pascalCase()}} extends Equatable {
  const {{feature_name.pascalCase()}}({
    required this.id,
    
  });

  final int id;

  @override
  List<Object?> get props => [
    id,
  ];


  @override
  String toString() {
    return '{{feature_name.pascalCase()}}(id: $id)';
  }

} 