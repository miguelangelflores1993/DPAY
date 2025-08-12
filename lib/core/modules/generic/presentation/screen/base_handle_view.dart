import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin BaseHandleView {
  final ValueNotifier<DateTime?> _currentBackPressTime =
      ValueNotifier<DateTime?>(null);
  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text(
              '¿Seguro que quieres salir?',
              textAlign: TextAlign.center,
            ),
            content: const Text('Los cambios no guardados se perderán.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: const Text('Sí'),
              ),
            ],
          ),
        ) ??
        false;
  }
  /// Handles the back button press behavior.
  // ignore: avoid_positional_boolean_parameters
  Future<bool> handleWillPop(BuildContext context, bool isForm) async {
    if (!isForm) {
      // Manejar el caso de doble tap para salir
      final now = DateTime.now();
      if (_currentBackPressTime.value == null ||
          now.difference(_currentBackPressTime.value!) >
              const Duration(seconds: 2)) {
        _currentBackPressTime.value = now;
        await Fluttertoast.showToast(msg: 'Presiona de nuevo para salir');
        return false;
      }
      return true;
    }

    // Si es un formulario, mostrar el diálogo de manera diferente
    return _showExitDialog(context);
  }
}
