import 'package:app/core/common/repository_base.dart';
import 'package:equatable/equatable.dart';

/// [Result] is the type of data returned after a successful use case execution.
/// [Params] is the type of data used as input for the use case.
abstract class UseCase<Result, Params> {
  ApiResponse<Result> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

// import 'package:fpdart/fpdart.dart';
// import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

// typedef UseCaseResult<T> = Future<Either<CustomException, T>>;
// typedef UseCaseVoidResult = UseCaseResult<void>;
// typedef UseCaseBoolResult = UseCaseResult<bool>;
// typedef UseCaseListResult<T> = UseCaseResult<List<T>>;

// abstract class BaseUseCase<Type, Params> {
//   BaseUseCase(this.repository);

//   final dynamic repository;

//   UseCaseResult<Type> call(Params params);
// }

// mixin SimpleUseCaseMixin<Type, Params> on BaseUseCase<Type, Params> {
//   UseCaseResult<Type> execute(UseCaseResult<Type> Function(Params) repositoryMethod, Params params) {
//     return repositoryMethod(params);
//   }

//   UseCaseResult<Type> executeNoParams(UseCaseResult<Type> Function() repositoryMethod) {
//     return repositoryMethod();
//   }
// }
