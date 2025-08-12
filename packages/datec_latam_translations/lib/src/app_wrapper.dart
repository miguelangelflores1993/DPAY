// my_package/lib/app_wrapper.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EasyLocalizationWrapper extends StatelessWidget {
  final Widget child;
  final List<Locale> supportedLocales;

  static List<LocalizationsDelegate<dynamic>> localizationDelegatesDatec(
    BuildContext context,
  ) => context.localizationDelegates;

  static List<Locale> supportedLocalesDatec(BuildContext context) =>
      context.supportedLocales;

  static Locale localeDatec(BuildContext context) => context.locale;

  const EasyLocalizationWrapper({
    super.key,
    required this.child,
    this.supportedLocales = const [Locale('es'), Locale('en')],
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'packages/datec_latam_translations/assets/translations',
      fallbackLocale: const Locale('es'),
      child: child,
    );
  }
}
