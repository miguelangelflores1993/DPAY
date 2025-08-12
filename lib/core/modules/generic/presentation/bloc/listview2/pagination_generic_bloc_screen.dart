import 'package:app/core/modules/generic/presentation/bloc/listview2/filters.dart';
import 'package:app/core/modules/generic/presentation/bloc/listview2/pagination_generic_bloc.dart';
import 'package:app/core/modules/generic/presentation/bloc/listview2/pagination_generic_state.dart';
import 'package:app/core/modules/generic/presentation/screen/base_handle_view.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:networking_flutter_dio/core/networking/custom_exception.dart';

/// Base class for pages using a [ListViewGenericBlocPage].
///
/// [B] - The Bloc type
/// [Result] - The data type returned in success
/// [Params] - The parameters used in the event
abstract class ListViewGenericBlocPage<B extends ListViewtBloc<Result, GenericQueryBuilder>, Result, Params>
    extends StatelessWidget
    with BaseHandleView {
  ListViewGenericBlocPage({
    required this.bloc,
    super.key,
    this.isForm = true,
    this.wrapWithScaffold = true,
  });

  final B bloc;
  final bool isForm;
  final bool wrapWithScaffold;

  /// Override to build the UI based on current BLoC state.
  Widget builder(BuildContext context, ListViewState<Result> state);

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
  void onLoading(BuildContext context, ListViewState<Result> state) {
    EasyLoading.show(status: AppStrings.loading, dismissOnTap: false);
  }

  /// Default global listener behavior (can be extended via hooks)

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<B>(create: (_) => bloc)],
      child: StatefulWrapper(
        onInit: (ctx) {
          // logarte.attach(context: ctx, visible: true);
        },
        child: BlocBuilder<B, ListViewState<Result>>(
          builder: (context, state) {
            if (wrapWithScaffold) {
              return Scaffold(
                body: SafeArea(bottom: false, child: builder(context, state)),
              );
            }
            return builder(context, state);
          },
        ),
      ),
    );
  }
}

class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({required this.child, required this.onInit, super.key});
  final Widget child;
  final void Function(BuildContext context) onInit;

  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.onInit(context));
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
