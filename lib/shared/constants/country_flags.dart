import 'package:app/shared/constants/app_images.dart';

Map<String, String> get countryFlags => {
  '+591': '🇧🇴', // Bolivia
  '+1': '🇺🇸',   // Estados Unidos/Canadá
  '+52': '🇲🇽',  // México
  '+54': '🇦🇷',  // Argentina
  '+55': '🇧🇷',  // Brasil
  '+56': '🇨🇱',  // Chile
  '+57': '🇨🇴',  // Colombia
  '+58': '🇻🇪',  // Venezuela
  '+593': '🇪🇨', // Ecuador
  '+51': '🇵🇪',  // Perú
  '+595': '🇵🇾', // Paraguay
  '+598': '🇺🇾', // Uruguay
  '+34': '🇪🇸',  // España
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
