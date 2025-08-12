import 'package:app/app/injection.dart';
import 'package:app/core/modules/generic/presentation/bloc/form/form_generic_event.dart';
import 'package:app/core/ui/widgets/molecules/molecules.dart';
import 'package:app/modules/auth/domain/usecases/change_password_use_case.dart';
import 'package:app/modules/auth/presentation/pages/security/bloc/change_password_bloc.dart';
import 'package:app/modules/auth/presentation/pages/security/widgets/change_password_content_form_widget.dart';
import 'package:app/modules/auth/presentation/pages/security/widgets/change_password_header_form_widget.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordInitWidget extends StatelessWidget {
  const ChangePasswordInitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppForm(
      customPadding: EdgeInsets.zero,
      labelSubmitButton: AppStrings.updatePassword,
      onSubmit: (data) {
        if (data['currentPassword'] == data['newPassword']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppStrings.passwordSameAsOld)),
          );
          return;
        }

        context.read<ChangePasswordBloc>().add(
          SubmitEvent(
            sl<ChangePasswordUseCase>(),
            params: ParamsChangePassword(
              currentPassword: data['currentPassword'] as String,
              newPassword: data['newPassword'] as String,
            ),
          ),
        );
      },
      header: const ChangePasswordHeaderWidget(),
      content: const ChangePasswordContentWidget(),
    );
  }
}
