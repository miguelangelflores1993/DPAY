import 'dart:io';

import 'package:app/core/config/logarte.dart';
import 'package:app/core/modules/generic/presentation/bloc/flexible/flexible_base_state.dart';
import 'package:app/core/modules/generic/presentation/bloc/flexible/flexible_bloc.dart';
import 'package:app/core/modules/generic/presentation/screen/base_handle_view.dart';
import 'package:app/shared/enums/app_form_enum.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:logarte/logarte.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

/// Base class for pages using a [GenericFlexibleBlocPage].
///
/// [Bloc] - The Bloc type
abstract class GenericFlexibleBlocPage<Bloc extends FlexibleBaseBloc> extends StatelessWidget with BaseHandleView {
  GenericFlexibleBlocPage({required this.bloc, super.key, this.isForm = false});

  final Bloc bloc;
  final bool isForm;

  /// Override to build the UI based on current BLoC state.
  Widget builder(BuildContext context, FlexibleState state);

  /// The [onSubmitSuccess] method is called when a form submission succeeds.
  Future<void> onSubmitSuccess(BuildContext context, {String? message}) async {
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
  void onLoading(BuildContext context, FlexibleState state) {
    EasyLoading.show(status: AppStrings.loading, dismissOnTap: false);
  }

  /// Default global listener behavior (can be extended via hooks)
  Future<void> _internalListener(
    BuildContext context,
    FlexibleState state,
  ) async {
    switch (state.status) {
      case AppStatus.initial:
        await EasyLoading.dismiss();
      case AppStatus.loading:
        onLoading(context, state);
      case AppStatus.success:
        await onSubmitSuccess(context);
      case AppStatus.error:
        await EasyLoading.dismiss();
        if (state.error != null) {
          await EasyLoading.showError(state.error!.message);
          if (!context.mounted) return;
          onError(context, state.error!);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<Bloc>(create: (_) => bloc)],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          final shouldPop = await handleWillPop(context, isForm);
          if (shouldPop) {
            if (!context.mounted) return;
            final router = GoRouter.of(context);
            if (router.canPop()) {
              router.pop();
            } else {
              exit(0);
            }
          }
        },
        child: BlocConsumer<Bloc, FlexibleState>(
          listener: _internalListener,
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(child: builder(context, state)),
              floatingActionButton: LogarteMagicalTap(
                logarte: logarte,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.touch_app_rounded),
                    title: Text('LogarteMagicalTap'),
                    subtitle: Text(
                      'Tap 10 times to attach the magical button.',
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
