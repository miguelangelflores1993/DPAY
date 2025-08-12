import 'package:easy_localization/easy_localization.dart';

Future<void> initializeTranslations() async {
  await EasyLocalization.ensureInitialized();
}
