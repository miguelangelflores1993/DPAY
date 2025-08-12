import 'package:fpdart/fpdart.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

export 'package:app/core/common/mixins/auth_repository_mixin.dart';
export 'package:fpdart/fpdart.dart';
export 'package:networking_flutter_dio/core/networking/custom_exception.dart';

typedef ApiResponse<T> = Future<Either<CustomException, T>>;
typedef ApiResponseVoid = ApiResponse<void>;
typedef ApiResponseBool = ApiResponse<bool>;
typedef ApiResponseList<T> = ApiResponse<List<T>>;

mixin SimpleRepositoryMixin {
  ApiResponse<T> execute<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Right(result);
    } on CustomException catch (e) {
      return Left(e);
    }
  }
}
