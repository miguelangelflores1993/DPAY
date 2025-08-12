import 'package:app/shared/constants/app_images.dart';

Map<String, String> get countryFlags => {
  '+591': AppImages.bolivianFlag,
};

String? getCountryCodeByPhone(String phone) {
  return countryFlags.keys.firstWhere(
    (key) => phone.startsWith(key),
    orElse: () => '',
  );
}
String trimCountryCode(String phone) {
  final countryCode = getCountryCodeByPhone(phone);
  if (countryCode != null && countryCode.isNotEmpty) {
    return phone.replaceFirst(countryCode, '').trim();
  }
  return phone;
}
