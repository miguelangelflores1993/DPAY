import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  // General
  static const String _common = 'common';
  static const String _validation = 'validation';

  // Screens
  static const String _registerScreen = 'register_screen';
  static const String _extraRegisterScreen = 'extra_register_screen';
  static const String _loginScreen = 'login_screen';
  static const String _forgotPasswordScreen = 'forgot_password_screen';
  static const String _otpScreen = 'otp_screen';
  static const String _homeScreen = 'home_screen';
  static const String _searchScreen = 'search_screen';
  static const String _cartScreen = 'cart_screen';
  static const String _profileScreen = 'profile_screen';
  static const String _productDetailScreen = 'product_detail_screen';
  static const String _addressScreen = 'address_screen';
  static const String _checkoutScreen = 'checkout_screen';
  static const String _billingScreen = 'billing_screen';
  static const String _successScreen = 'success_screen';
  static const String _ordersScreen = 'orders_screen';
  static const String _changePasswordScreen = 'change_password_screen';
  static const String _errorTranslations = 'error_translations';

  // Common
  static String get login => '$_common.login'.tr();
  static String get signIn => '$_common.sign_in'.tr();
  static String get signUp => '$_common.sign_up'.tr();
  static String get logout => '$_common.logout'.tr();
  static String get createAccount => '$_common.create_account'.tr();
  static String get continueText => '$_common.continue'.tr();
  static String get name => '$_common.name'.tr();
  static String get lastName => '$_common.lastName'.tr();
  static String get email => '$_common.email'.tr();
  static String get phone => '$_common.phone'.tr();
  static String get emailOrPhone => '$_common.email_phone'.tr();
  static String get password => '$_common.password'.tr();
  static String get hintName => '$_common.hint_name'.tr();
  static String get hintLastname => '$_common.hint_lastName'.tr();
  static String get hintPhone => '$_common.hint_phone'.tr();
  static String get hintEmail => '$_common.hint_email'.tr();
  static String get hintPassword => '$_common.hint_password'.tr();
  static String get passwordValidation => '$_common.password_validation'.tr();
  static String get yourBirthday => '$_common.your_birthday'.tr();
  static String get hintBirthday => '$_common.hint_birthday'.tr();
  static String get yourGender => '$_common.your_gender'.tr();
  static String get hintGender => '$_common.hint_gender'.tr();
  static String get male => '$_common.gender.male'.tr();
  static String get female => '$_common.gender.female'.tr();
  static String get other => '$_common.gender.other'.tr();
  static String get retry => '$_common.retry'.tr();
  static String get contactSupport => '$_common.contact_support'.tr();
  static String get delete => '$_common.delete'.tr();
  static String get edit => '$_common.edit'.tr();
  static String get accept => '$_common.accept'.tr();
  static String get save => '$_common.save'.tr();
  static String get add => '$_common.add'.tr();
  static String get cancel => '$_common.cancel'.tr();
  static String get loadingUserData => '$_common.loading_userdata'.tr();
  static String get loading => '$_common.loading'.tr();
  static String get terms => '$_common.terms'.tr();
  static String get errorPage => '$_common.error_page'.tr();
  static String get goBack => '$_common.go_back'.tr();
  static String get goToCart => '$_common.go_to_cart'.tr();
  static String get goToHome => '$_common.go_to_home'.tr();
  static String get connectionRestored => '$_common.connection_restored'.tr();
  static String get connectionLost => '$_common.connection_lost'.tr();
  static String get logoutSuccess => '$_common.logout_success'.tr();
  static String get unknownError => '$_common.unknown_error'.tr();
  static String get unrecognizedError => '$_common.unrecognized_error'.tr();
  static String get serializationError => '$_common.serialization_error'.tr();
  static String get verifyAccount => '$_common.verify_account'.tr();

  // Validation
  static String get requiredField => '$_validation.required'.tr();
  static String get passwordEmpty => '$_validation.password.empty'.tr();
  static String get passwordMinLength =>
      '$_validation.password.min_length'.tr();
  static String get passwordMaxLength =>
      '$_validation.password.max_length'.tr();
  static String get passwordLowerCase =>
      '$_validation.password.lower_case'.tr();
  static String get passwordUpperCase =>
      '$_validation.password.upper_case'.tr();
  static String get passwordSameAsOld =>
      '$_validation.password.same_as_old'.tr();
  static String get passwordDigitOrSpecial =>
      '$_validation.password.digit_or_special'.tr();

  static String get passwordSpecialCharacters =>
      '$_validation.password.special_characters'.tr();
  static String get passwordUpperLowerCase =>
      '$_validation.password.upper_lower_case'.tr();
  static String get passwordLengthError =>
      '$_validation.password.min_length_error'.tr();

  static String get emailEmpty => '$_validation.email.empty'.tr();
  static String get emailMinLength => '$_validation.email.min_length'.tr();
  static String get emailMaxLength => '$_validation.email.max_length'.tr();
  static String get emailInvalidFormat =>
      '$_validation.email.invalid_format'.tr();
  static String get emailInvalidTld => '$_validation.email.invalid_tld'.tr();
  static String get emailInvalidChars =>
      '$_validation.email.invalid_chars'.tr();
  static String get emailStartsOrEndsWithDot =>
      '$_validation.email.starts_or_ends_with_dot'.tr();
  static String get emailConsecutiveDots =>
      '$_validation.email.consecutive_dots'.tr();
  static String get emailInvalidEmail =>
      '$_validation.email.invalid_email'.tr();

  static String get nameEmpty => '$_validation.name.empty'.tr();
  static String get nameInvalidChars => '$_validation.name.invalid_chars'.tr();

  static String get lastNameEmpty => '$_validation.last_name.empty'.tr();
  static String get lastNameInvalidChars =>
      '$_validation.last_name.invalid_chars'.tr();

  static String get phoneEmpty => '$_validation.phone.empty'.tr();
  static String get phoneOnlyDigits => '$_validation.phone.only_digits'.tr();
  static String get phoneNoSpacesSpecialChars =>
      '$_validation.phone.no_spaces_special_chars'.tr();
  static String get phoneInvalidLength =>
      '$_validation.phone.invalid_length'.tr();

  static String get documentNumberEmpty =>
      '$_validation.document_number.empty'.tr();
  static String get documentNumberDigitsOnly =>
      '$_validation.document_number.digits_only'.tr();
  static String get documentNumberInvalidLength =>
      '$_validation.document_number.invalid_length'.tr();

  // Register Screen
  static String get register => '$_registerScreen.register'.tr();
  static String freeGift(String gift) {
    return '$_registerScreen.free_gift'.tr(args: [gift]);
  }

  static String get successRegister => '$_registerScreen.success_register'.tr();

  static String get complete => '$_registerScreen.complete'.tr();
  static String get cupon => '$_registerScreen.cupon'.tr();
  static String get termsPrefix => '$_registerScreen.terms_text.prefix'.tr();
  static String get termsInitial => '$_registerScreen.terms_text.terms'.tr();
  static String get termsMiddle => '$_registerScreen.terms_text.middle'.tr();
  static String get termsPrivacy => '$_registerScreen.terms_text.privacy'.tr();
  static String get alreadyHaveAccount =>
      '$_registerScreen.already_have_account'.tr();
  static String get loginHere => '$_registerScreen.login_here'.tr();

  // Extra Register Screen
  static String get almostFinish => '$_extraRegisterScreen.almost_finish'.tr();
  static String get lastStep => '$_extraRegisterScreen.last_step'.tr();
  static String get haveChildren => '$_extraRegisterScreen.have_children'.tr();
  static String get havePets => '$_extraRegisterScreen.have_pets'.tr();
  static String get selectInterests =>
      '$_extraRegisterScreen.select_interests'.tr();
  static String get technology =>
      '$_extraRegisterScreen.interests.technology'.tr();
  static String get events => '$_extraRegisterScreen.interests.events'.tr();
  static String get fashion => '$_extraRegisterScreen.interests.fashion'.tr();
  static String get home => '$_extraRegisterScreen.interests.home'.tr();
  static String get beauty => '$_extraRegisterScreen.interests.beauty'.tr();
  static String get toys => '$_extraRegisterScreen.interests.toys'.tr();
  static String get sports => '$_extraRegisterScreen.interests.sports'.tr();
  static String get food => '$_extraRegisterScreen.interests.food'.tr();
  static String get drinks => '$_extraRegisterScreen.interests.drinks'.tr();
  static String get howStyle => '$_extraRegisterScreen.how_style'.tr();
  static String get styleCasual => '$_extraRegisterScreen.style.casual'.tr();
  static String get styleFormal => '$_extraRegisterScreen.style.formal'.tr();
  static String get styleUrban => '$_extraRegisterScreen.style.urban'.tr();
  static String get finishRegister =>
      '$_extraRegisterScreen.finish_register'.tr();
  static String get skipStep => '$_extraRegisterScreen.skip_step'.tr();

  // Login Screen
  static String get loginTitle => '$_loginScreen.title'.tr();
  static String get notAccount => '$_loginScreen.not_account'.tr();
  static String get forgotPassword => '$_loginScreen.forgot_password'.tr();
  static String get successLogin => '$_loginScreen.success_login'.tr();

  // Forgot Password Screen
  static String get forgotPasswordSubtitle =>
      '$_forgotPasswordScreen.subtitle'.tr();
  static String get sendInstructions =>
      '$_forgotPasswordScreen.send_instructions'.tr();
  static String get successForgotPassword =>
      '$_forgotPasswordScreen.success_forgot_password'.tr();

  // OTP Screen
  static String get otpTitle => '$_otpScreen.title'.tr();
  static String get otpSubtitle => '$_otpScreen.subtitle'.tr();
  static String get otpNotRecieved => '$_otpScreen.not_received'.tr();
  static String get otpResend => '$_otpScreen.resend'.tr();
  static String get successVerification =>
      '$_otpScreen.success_verification'.tr();

  // Home Screen
  static String get searchHint => '$_homeScreen.search_hint'.tr();
  static String get myProfile => '$_homeScreen.my_profile'.tr();
  static String get services => '$_homeScreen.categories.services'.tr();
  static String get lastest => '$_homeScreen.categories.latest'.tr();
  //product_added_to_cart
  static String get productAddedToCart =>
      '$_homeScreen.product_added_to_cart'.tr();
  static String get errorAddingProduct =>
      '$_homeScreen.error_adding_product'.tr();
  static String get productNoStock => '$_homeScreen.product_no_stock'.tr();

  // Search Screen
  static String get trendingSearchTitle => '$_searchScreen.trending'.tr();
  static String get productsSearchTitle => '$_searchScreen.products'.tr();
  static String resultsFor(String query) {
    return '$_searchScreen.results_for'.tr(args: [query]);
  }

  static String get seeMore => '$_searchScreen.see_more'.tr();
  static String get orderBy => '$_searchScreen.order_by'.tr();
  static String get mostRelevant => '$_searchScreen.most_relevant'.tr();
  static String get lowerPrice => '$_searchScreen.lower_price'.tr();
  static String get higherPrice => '$_searchScreen.higher_price'.tr();
  static String get higherDiscount => '$_searchScreen.higher_discount'.tr();
  static String get newest => '$_searchScreen.newest'.tr();

  // Product Detail Screen

  static String get addToCart => '$_productDetailScreen.add_to_cart'.tr();
  static String get shippingMethodsTitle =>
      '$_productDetailScreen.shipping_methods.title'.tr();
  static String get shipping =>
      '$_productDetailScreen.shipping_methods.shipping'.tr();
  static String get pickup =>
      '$_productDetailScreen.shipping_methods.pickup'.tr();
  static String get delivery =>
      '$_productDetailScreen.shipping_methods.delivery'.tr();
  static String get deliveryTo => '$_productDetailScreen.delivery_to'.tr();
  static String get chooseAddress =>
      '$_productDetailScreen.choose_address'.tr();
  static String get freeShipping => '$_productDetailScreen.free_shipping'.tr();
  static String get securePayment =>
      '$_productDetailScreen.secure_payment'.tr();
  static String get returnPolicy => '$_productDetailScreen.return_policy'.tr();
  static String get payInInstallments =>
      '$_productDetailScreen.pay_in_installments'.tr();
  static String get giftEligible => '$_productDetailScreen.gift_eligible'.tr();
  static String get paymentMethods =>
      '$_productDetailScreen.payment_methods'.tr();
  static String get productDetails =>
      '$_productDetailScreen.product_details'.tr();
  static String get newProduct => '$_productDetailScreen.new_product'.tr();
  static String get outOfStock => '$_productDetailScreen.out_of_stock'.tr();

  // Cart Screen
  static String get myCart => '$_cartScreen.my_cart'.tr();
  static String get articles => '$_cartScreen.articles'.tr();
  static String get orderDetails => '$_cartScreen.order_details'.tr();
  static String get emptyCart => '$_cartScreen.empty_cart'.tr();
  static String get emptyCartSub => '$_cartScreen.empty_cart_subtitle'.tr();
  static String get subtotal => '$_cartScreen.subtotal'.tr();
  static String get expensesTaxes => '$_cartScreen.expenses_taxes'.tr();
  static String get buyNow => '$_cartScreen.buy_now'.tr();
  static String get forGift => '$_cartScreen.for_gift'.tr();
  static String get productNotAvailable =>
      '$_cartScreen.product_not_available'.tr();

  // Profile Screen
  static String get profileTitle => '$_profileScreen.title'.tr();
  static String get personalData => '$_profileScreen.personal_data'.tr();
  static String get myBilling => '$_profileScreen.my_billing'.tr();
  static String get myAddresses => '$_profileScreen.my_addresses'.tr();
  static String get mySubscriptions => '$_profileScreen.my_subscriptions'.tr();
  static String get security => '$_profileScreen.security'.tr();
  static String get myPaymentMethods =>
      '$_profileScreen.my_payments_methods'.tr();
  static String get myOrders => '$_profileScreen.my_orders'.tr();
  static String get updateProfile => '$_profileScreen.update_profile'.tr();
  static String get successProfileUpdate =>
      '$_profileScreen.success_profile_update'.tr();
  static String get hintCamera => '$_profileScreen.hint_camera'.tr();
  static String get hintGallery => '$_profileScreen.hint_gallery'.tr();
  static String get hintDelete => '$_profileScreen.hint_delete'.tr();
  static String get deleteAccount => '$_profileScreen.delete_account'.tr();
  static String get deleteAccountDescription =>
      '$_profileScreen.delete_account_description'.tr();
  static String get emailNotVerified =>
      '$_profileScreen.email_not_verified'.tr();
  static String get emailNotVerifiedDescription =>
      '$_profileScreen.email_not_verified_description'.tr();
  static String get verifyEmail => '$_profileScreen.verify_email'.tr();

  // Address Screen
  static String get addAddress => '$_addressScreen.add_address'.tr();
  static String get updateAddress => '$_addressScreen.update_address'.tr();
  static String get successAddress => '$_addressScreen.success_address'.tr();
  static String get updateSuccessAddress =>
      '$_addressScreen.update_success_address'.tr();
  static String get address => '$_addressScreen.address'.tr();
  static String get noAddress => '$_addressScreen.no_address'.tr();
  static String get noAddressSubtitle =>
      '$_addressScreen.no_address_subtitle'.tr();
  static String get saveAddress => '$_addressScreen.save_address'.tr();
  static String get houseNumber => '$_addressScreen.house_number'.tr();
  static String get city => '$_addressScreen.city'.tr();
  static String get reference => '$_addressScreen.reference'.tr();
  static String get alias => '$_addressScreen.alias'.tr();
  static String get hintAddress => '$_addressScreen.hint_address'.tr();
  static String get hintHouseNumber => '$_addressScreen.hint_house_number'.tr();
  static String get hintCity => '$_addressScreen.hint_city'.tr();
  static String get hintReference => '$_addressScreen.hint_reference'.tr();
  static String get hintAlias => '$_addressScreen.hint_alias'.tr();
  static String get hintMap => '$_addressScreen.hint_map'.tr();
  static String get principal => '$_addressScreen.principal'.tr();
  static String get deleteAddressTitle =>
      '$_addressScreen.delete_address_title'.tr();
  static String get deleteAddressSubtitle =>
      '$_addressScreen.delete_address_subtitle'.tr();
  static String get setDefaultAddress =>
      '$_addressScreen.set_default_address'.tr();
  static String get iconLocation => '$_addressScreen.icon_location'.tr();

  // Map Configuration
  static String get locationDeniedPermanently =>
      '$_addressScreen.map_configuration.location_denied_permanently'.tr();
  static String get locationDeniedTemporarilyDescription =>
      '$_addressScreen.map_configuration.location_denied_temporarily_description'
          .tr();
  static String get openSettings =>
      '$_addressScreen.map_configuration.open_settings'.tr();
  static String get gpsDisabled =>
      '$_addressScreen.map_configuration.gps_disabled'.tr();
  static String get enableGps =>
      '$_addressScreen.map_configuration.enable_gps'.tr();
  static String get checkGps =>
      '$_addressScreen.map_configuration.check_gps'.tr();
  static String get needLocationPermission =>
      '$_addressScreen.map_configuration.need_location_permission'.tr();
  static String get locationPermissionDescription =>
      '$_addressScreen.map_configuration.location_permission_description'.tr();
  static String get grantPermission =>
      '$_addressScreen.map_configuration.grant_permission'.tr();
  // need_address_location
  static String get needAddressLocation =>
      '$_addressScreen.map_configuration.need_address_location'.tr();

  // checkout Screen
  static String get orderSummary => '$_checkoutScreen.order_summary'.tr();
  static String get deliveryMethod => '$_checkoutScreen.delivery_method'.tr();
  static String get checkoutPickup => '$_checkoutScreen.pickup'.tr();
  static String get contactInformation =>
      '$_checkoutScreen.contact_information'.tr();
  static String get shippingAddress => '$_checkoutScreen.shipping_address'.tr();
  static String get billingInformation =>
      '$_checkoutScreen.billing_information'.tr();
  static String get items => '$_checkoutScreen.items'.tr();
  static String get cuponOrGiftCard =>
      '$_checkoutScreen.cupon_or_gift_card'.tr();
  static String get apply => '$_checkoutScreen.apply'.tr();
  static String get chooseBillingAddress =>
      '$_checkoutScreen.choose_billing_address'.tr();
  static String get toBeDefined => '$_checkoutScreen.to_be_defined'.tr();
  static String get procceedToPayment =>
      '$_checkoutScreen.proceed_to_payment'.tr();
  static String get total => '$_checkoutScreen.total'.tr();
  static String get addCheckoutAddress => '$_checkoutScreen.add_address'.tr();
  static String get addBillingAddress => '$_checkoutScreen.add_billing'.tr();
  static String get successCheckout => '$_checkoutScreen.success_checkout'.tr();
  static String get qrSaved => '$_checkoutScreen.qr_saved'.tr();
  static String get noQRSaved => '$_checkoutScreen.no_qr_saved'.tr();
  static String get pickupPoints => '$_checkoutScreen.pickup_points'.tr();
  static String get selectPickupPoint =>
      '$_checkoutScreen.select_pickup_point'.tr();
  static String get completeYourNumber =>
      '$_checkoutScreen.complete_your_number'.tr();

  // Error Messages
  static String get errorStockTitle =>
      '$_checkoutScreen.error_stock_title'.tr();
  static String get errorStockSubtitle1 =>
      '$_checkoutScreen.error_stock_subtitle_1'.tr();
  static String get errorStockSubtitle2 =>
      '$_checkoutScreen.error_stock_subtitle_2'.tr();

  // Billing Screen
  static String get updateBilling => '$_billingScreen.update_billing'.tr();
  static String get successBilling => '$_billingScreen.success_billing'.tr();
  static String get updateSuccessBilling =>
      '$_billingScreen.update_success_billing'.tr();
  static String get legalName => '$_billingScreen.legal_name'.tr();
  static String get hintLegalName => '$_billingScreen.hint_legal_name'.tr();
  static String get legalTaxNumber => '$_billingScreen.legal_tax_number'.tr();
  static String get hintLegalTaxNumber =>
      '$_billingScreen.hint_legal_tax_number'.tr();
  static String get noBillingData => '$_billingScreen.no_billing_data'.tr();
  static String get noBillingDataSubtitle =>
      '$_billingScreen.no_billing_data_subtitle'.tr();

  // Success Screen
  static String get successTitle => '$_successScreen.success'.tr();
  static String get successSubtitle => '$_successScreen.success_subtitle'.tr();
  static String get continueShopping =>
      '$_successScreen.continue_shopping'.tr();
  static String get orderNumber => '$_successScreen.order_number'.tr();

  // Order Screen
  static String get all => '$_ordersScreen.all'.tr();
  static String get byStatus => '$_ordersScreen.by_status'.tr();
  static String get byDate => '$_ordersScreen.by_date'.tr();

  //status
  static String get status => '$_ordersScreen.status'.tr();
  static String get order => '$_ordersScreen.order'.tr();
  static String get orderDate => '$_ordersScreen.order_date'.tr();
  static String get totalAmount => '$_ordersScreen.total_amount'.tr();
  static String get payOrder => '$_ordersScreen.pay_order'.tr();
  static String get viewDetails => '$_ordersScreen.view_details'.tr();
  static String get noOrders => '$_ordersScreen.no_orders'.tr();
  static String get noOrdersSubtitle =>
      '$_ordersScreen.no_orders_subtitle'.tr();
  static String get exploreProducts => '$_ordersScreen.explore_products'.tr();

  static String get inProgress => '$_ordersScreen.in_progress'.tr();
  static String get delivered => '$_ordersScreen.order_status.delivered'.tr();
  static String get cancelled => '$_ordersScreen.order_status.cancelled'.tr();
  static String get confirmed => '$_ordersScreen.order_status.confirmed'.tr();
  static String get pendingConfirmation =>
      '$_ordersScreen.order_status.pending_confirmation'.tr();
  static String get readyForPickup =>
      '$_ordersScreen.order_status.ready_for_pickup'.tr();
  static String get returned => '$_ordersScreen.order_status.returned'.tr();
  static String get rejected => '$_ordersScreen.order_status.rejected'.tr();
  static String get processing => '$_ordersScreen.order_status.processing'.tr();
  static String get pending => '$_ordersScreen.order_status.pending'.tr();
  static String get shippingCost => '$_ordersScreen.shipping_cost'.tr();

  // Change Password Screen
  static String get changePassword =>
      '$_changePasswordScreen.change_password'.tr();
  static String get currentPassword =>
      '$_changePasswordScreen.current_password'.tr();
  static String get newPassword => '$_changePasswordScreen.new_password'.tr();
  static String get hintCurrentPassword =>
      '$_changePasswordScreen.hint_current_password'.tr();
  static String get hintNewPassword =>
      '$_changePasswordScreen.hint_new_password'.tr();
  static String get updatePassword =>
      '$_changePasswordScreen.update_password'.tr();
  static String get successChangePassword =>
      '$_changePasswordScreen.success_change_password'.tr();

  // Error Translations
  static String get errorAccountInactive =>
      '$_errorTranslations.account_inactive'.tr();
  static String get errorInvalidCredentials =>
      '$_errorTranslations.invalid_credentials'.tr();
  static String get errorUserNotFound =>
      '$_errorTranslations.user_not_found'.tr();
  static String get errorEmailInUse => '$_errorTranslations.email_in_use'.tr();
  static String get errorPasswordLowercase =>
      '$_errorTranslations.password_lowercase'.tr();
  static String get errorPasswordDigit =>
      '$_errorTranslations.password_digit'.tr();
  static String get errorCodeExpired => '$_errorTranslations.code_expired'.tr();
  static String get errorCodesNoMatch =>
      '$_errorTranslations.codes_no_match'.tr();
  static String get errorEmailConfirmed =>
      '$_errorTranslations.email_confirmed'.tr();
  static String get errorNoPendingCode =>
      '$_errorTranslations.no_pending_code'.tr();
  static String get errorEmailOrPasswordInvalid =>
      '$_errorTranslations.email_or_password_invalid'.tr();
  static String get errorUserBlocked => '$_errorTranslations.user_blocked'.tr();
  static String get errorTooManyRequests =>
      '$_errorTranslations.too_many_requests'.tr();
  static String get errorIncorrectPassword =>
      '$_errorTranslations.incorrect_password'.tr();
  static String get errorAccountBlocked =>
      '$_errorTranslations.account_blocked'.tr();
  static String get errorSessionExpired =>
      '$_errorTranslations.session_expired'.tr();
  static String get errorEmailNotFound =>
      '$_errorTranslations.email_not_found'.tr();
  static String get errorInvalidToken =>
      '$_errorTranslations.invalid_token'.tr();
  static String get errorNewPasswordSame =>
      '$_errorTranslations.new_password_same'.tr();

  static String get errorNetworkCancelled =>
      '$_errorTranslations.network.cancel'.tr();
  static String get errorNetworkConnectionTimeout =>
      '$_errorTranslations.network.connection_timeout'.tr();
  static String get errorNetworkSendTimeout =>
      '$_errorTranslations.network.send_timeout'.tr();
  static String get errorNetworkReceiveTimeout =>
      '$_errorTranslations.network.receive_timeout'.tr();
  static String get errorNetworkBadResponse =>
      '$_errorTranslations.network.bad_response'.tr();
  static String get errorNetworkUnknown =>
      '$_errorTranslations.network.unknown'.tr();
  static String get errorNetworkBadCertificate =>
      '$_errorTranslations.network.bad_certificate'.tr();
  static String get errorNetworkConnectionError =>
      '$_errorTranslations.network.connection_error'.tr();
  static String get errorNetworkFormatException =>
      '$_errorTranslations.network.format_exception'.tr();

  //

  // static String greetingNamed({
  //   required String firstName,
  //   required String lastName,
  // }) {
  //   return 'greeting_named'.tr(
  //     namedArgs: {'firstName': firstName, 'lastName': lastName},
  //   );
  // }

  // static String itemCount(int count) => 'items'.plural(count);
}
