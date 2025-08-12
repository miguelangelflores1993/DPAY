import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Página genérica que acepta múltiples BlocProvider y construye su UI.
abstract class MultiBlocPage extends StatelessWidget {
  const MultiBlocPage({
    required this.providers,
    super.key,
    this.wrapWithScaffold = true,
  });

  /// Lista de BlocProvider widgets.
  final List<BlocProvider> providers;
  final bool wrapWithScaffold;

  /// Implementar este método para construir la UI con acceso al contexto.
  Widget builder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: Builder(
        builder: (context) {
          final page = builder(context);
          if (wrapWithScaffold) {
            return Scaffold(body: SafeArea(bottom: false, child: page));
          }
          return page;
        },
      ),
    );
  }
}
