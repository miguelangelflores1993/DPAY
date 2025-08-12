import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SingleBlocPage<B extends BlocBase<S>, S>
    extends StatelessWidget {
  const SingleBlocPage({
    required this.bloc,
    super.key,
    this.wrapWithScaffold = true,
  });

  final B bloc;
  final bool wrapWithScaffold;

  /// Implementar este método para construir la UI con acceso al estado.
  Widget builder(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>.value(
      value: bloc,
      child: BlocBuilder<B, S>(
        builder: (context, state) {
          final page = builder(context, state);
          if (wrapWithScaffold) {
            return Scaffold(body: SafeArea(child: page));
          }
          return page;
        },
      ),
    );
  }
}
