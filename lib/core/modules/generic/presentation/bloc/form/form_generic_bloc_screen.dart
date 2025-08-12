import 'dart:io';

import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/core/modules/generic/presentation/screen/base_handle_view.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

/// Base class for pages using a [FormGenericBlocPage].
///
/// [B] - The Bloc type
/// [Result] - The data type returned in success
/// [Params] - The parameters used in the event
abstract class FormGenericBlocPage<B extends FormGenericBloc<Result, Params>, Result, Params> extends StatelessWidget
    with BaseHandleView {
  FormGenericBlocPage({
    required this.bloc,
    super.key,
    this.isForm = true,
    this.backRoute,
    this.canPop = true,
    this.wrapWithScaffold = true,
  });
  final bool canPop;
  final B bloc;
  final bool isForm;
  final bool wrapWithScaffold;
  final String? backRoute;

  /// Override to build the UI based on current BLoC state.
  Widget builder(BuildContext context, FormBaseState<Result> state);

  /// The [onSubmitSuccess] method is called when a form submission succeeds.
  Future<void> onSubmitSuccess(
    BuildContext context,
    FormBaseState<Result> state, {
    String? message,
  }) async {
    await EasyLoading.showSuccess(
      message ?? '¡Exitoso!',
      dismissOnTap: false,
      duration: const Duration(seconds: 3),
    );
    await Future<void>.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      onNavigateSuccess(context);
    }
  }

  @protected
  void onNavigateSuccess(BuildContext context) {}

  @protected
  void onMessageSuccess(String message) {}

  @protected
  void onError(BuildContext context, CustomException error) {
    EasyLoading.showError(error.message);
  }

  @protected
  void onLoading(BuildContext context, FormBaseState<Result> state) {
    EasyLoading.show(status: AppStrings.loading, dismissOnTap: false);
  }

  /// Método sobrescribible para controlar el listener del Bloc
  @protected
  void onListener(BuildContext context, FormBaseState<Result> state) {
    switch (state.status) {
      case AppStatus.initial:
        EasyLoading.dismiss();
      case AppStatus.loading:
        onLoading(context, state);
      case AppStatus.success:
        onSubmitSuccess(context, state);
      case AppStatus.error:
        EasyLoading.dismiss();
        if (state.error != null) {
          EasyLoading.showError(state.error!.message);
          onError(context, state.error!);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<B>(create: (_) => bloc)],
      child: BlocConsumer<B, FormBaseState<Result>>(
        listener: onListener,
        builder: (context, state) {
          if (wrapWithScaffold) {
            if (!isForm) {
              return Scaffold(
                body: SafeArea(bottom: false, child: builder(context, state)),
              );
            }
            return Scaffold(
              body: PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {
                  final router = GoRouter.of(context);
                  if (didPop) return;

                  final shouldPop = await handleWillPop(context, isForm);
                  if (shouldPop) {
                    // Solo realizar una única operación de navegación
                    if (backRoute != null) {
                      if (context.mounted) {
                        router.goNamed(backRoute!);
                      }
                    } else if (router.canPop()) {
                      if (context.mounted) {
                        router.pop();
                      }
                    } else {
                      exit(0);
                    }
                  }
                },
                child: SafeArea(bottom: false, child: builder(context, state)),
              ),
            );
          }
          return builder(context, state);
        },
      ),
    );
  }
}
