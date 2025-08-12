import 'package:datec_latam_translations/datec_latam_translations.dart';

Map<String, String> errorTranslations = {
  'User account is inactive or blocked.': AppStrings.errorAccountBlocked,
  'Invalid credentials': AppStrings.errorEmailOrPasswordInvalid,
  'User not found': AppStrings.errorUserNotFound,
  'The email is already in use.': AppStrings.errorEmailInUse,
  "Passwords must have at least one lowercase ('a'-'z').":
      AppStrings.errorPasswordLowercase,
  "Passwords must have at least one digit ('0'-'9').":
      AppStrings.errorPasswordDigit,
  'The verification code has expired.': AppStrings.errorCodeExpired,
  'Codes do not match.': AppStrings.errorCodesNoMatch,
  'Email already confirmed.': AppStrings.errorEmailConfirmed,
  'User does not have a pending verifica code.': AppStrings.errorNoPendingCode,
  'Invalid email or password.': AppStrings.errorEmailOrPasswordInvalid,
  'User is blocked.': AppStrings.errorUserBlocked,
  'Maximum number of requests reached. Please try again later.':
      AppStrings.errorTooManyRequests,
  'Incorrect password.': AppStrings.errorIncorrectPassword,
  'User account is blocked.': AppStrings.errorAccountBlocked,
  'Session expired.': AppStrings.errorSessionExpired,
  'Email not found.': AppStrings.errorEmailNotFound,
  'User not found.': AppStrings.errorUserNotFound,
  'Invalid token.': AppStrings.errorInvalidToken,
  'The new password cannot be the same as the current password.':
      AppStrings.errorNewPasswordSame,
};
