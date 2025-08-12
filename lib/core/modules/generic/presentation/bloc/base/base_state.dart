import 'package:app/shared/enums/app_form_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

typedef ValueGetter<T> = T Function();

abstract class BaseState extends Equatable {
  const BaseState({required this.status, this.error});
  final AppStatus status;
  final CustomException? error;

  @override
  List<Object?> get props => [status, error];

  bool get isInitial => status == AppStatus.initial;
  bool get isLoading => status == AppStatus.loading;
  bool get isSuccess => status == AppStatus.success;
  bool get isError => status == AppStatus.error;
}
