import 'package:app/app/injection.dart';
import 'package:app/core/common/usecases/usecase.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_bloc_screen.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_event.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_state.dart';
import 'package:app/core/ui/widgets/molecules/app_form.dart';
import 'package:app/core/ui/widgets/molecules/app_pinput_formfield.dart';
import 'package:app/modules/auth/domain/usecases/send_otp_use_case.dart';
import 'package:app/modules/auth/domain/usecases/verify_otp_use_case.dart';
import 'package:app/modules/auth/presentation/pages/otp/bloc/otp_verification_bloc.dart';
import 'package:app/modules/auth/presentation/pages/otp/bloc/send_otp_bloc.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OTPVerificationPage extends FormGenericBlocPage<OtpVerificationBloc, bool, String> {
  OTPVerificationPage({super.key})
    : pinController = TextEditingController(),
      focusNode = FocusNode(),
      super(bloc: sl<OtpVerificationBloc>(), backRoute: 'home');
  final TextEditingController pinController;
  final FocusNode focusNode;
  @override
  Future<void> onSubmitSuccess(BuildContext context, FormBaseState<bool> state, {String? message}) async {
    await super.onSubmitSuccess(
      context,
      state,
      message: AppStrings.successVerification,
    );
  }

  @override
  void onNavigateSuccess(BuildContext context) {
    context.go('/home');
  }

  @override
  Widget builder(BuildContext context, FormBaseState<bool> state) {
    return AppForm(
      content: const PinputFormField(name: 'code'),
      labelSubmitButton: AppStrings.createAccount,
      onSubmit: (data) {
        context.read<OtpVerificationBloc>().add(
          SubmitEvent(sl<VerifyOtpUseCase>(), params: data['code'] as String),
        );
      },
      footer: ResendCode(),
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          spacing: 16,
          children: [
            Text(
              AppStrings.otpTitle,
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              AppStrings.otpSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF61677D),
              ),
            ),
          ],
        ),
      ),
    );
   
  }
}

class ResendCode extends FormGenericBlocPage<SendOtpBloc, bool, NoParams> {
  ResendCode({super.key}) : super(bloc: sl<SendOtpBloc>(), wrapWithScaffold: false);

  @override
  Widget builder(BuildContext context, FormBaseState<bool> state) {
    return Container(
      padding: EdgeInsets.only(bottom: 3.h),
      child: RichText(
        text: TextSpan(
          text: AppStrings.otpNotRecieved,
          style: DefaultTextStyle.of(
            context,
          ).style.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
          children: [
            const WidgetSpan(child: SizedBox(width: 5)),
            TextSpan(
              text: AppStrings.otpResend,
              style: TextStyle(
                color: const Color(0xFFF47C2C),
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle resend OTP action
                  context.read<SendOtpBloc>().add(
                    SubmitEvent(sl<SendOtpUseCase>(), params: NoParams()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
