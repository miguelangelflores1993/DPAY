import 'package:app/core/ui/theme/app_theme.dart';
import 'package:app/core/ui/widgets/atoms/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:networking_flutter_dio/core/helper/typedefs.dart';
import 'package:sizer/sizer.dart';

class AppForm extends StatelessWidget {
  AppForm({
    required this.content,
    required this.labelSubmitButton,
    required this.onSubmit,
    required this.header,
    this.customPadding,
    this.backgroundColorButton,
    this.initialValue,
    this.footer,
    super.key,
  });
  final Widget content;
  final Widget header;
  final Map<String, dynamic>? initialValue;
  final String labelSubmitButton;
  final ValueChanged<JSON> onSubmit;
  final Widget? footer;
  final _formKey = GlobalKey<FormBuilderState>();
  final EdgeInsetsGeometry? customPadding;
  final Color? backgroundColorButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: FormBuilder(
        initialValue: initialValue ?? {},
        key: _formKey,

        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: customPadding ?? const EdgeInsets.all(20),
                    child: Column(children: [header, content]),
                  ),
                ),
                AppFormButton(
                  backgroundColorButton: backgroundColorButton,
                  footer: footer,
                  labelSubmitButton: labelSubmitButton,
                  formKey: _formKey,
                  onSubmit: onSubmit,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AppFormButton extends StatefulWidget {
  const AppFormButton({
    required this.backgroundColorButton,
    required this.footer,
    required this.labelSubmitButton,
    required GlobalKey<FormBuilderState> formKey,
    required this.onSubmit,
    super.key,
  }) : _formKey = formKey;

  final Color? backgroundColorButton;
  final Widget? footer;
  final String labelSubmitButton;
  final GlobalKey<FormBuilderState> _formKey;
  final ValueChanged<JSON> onSubmit;

  @override
  State<AppFormButton> createState() => _AppFormButtonState();
}

class _AppFormButtonState extends State<AppFormButton> {
  // NavigationBarInteractionMode _navBarMode = NavigationBarInteractionMode.unknown;
  // bool _isAndroid15 = false;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   _isAndroid15 = await NativeUtils.isAndroidVersion15orHigher();
    //   setState(() {});
    //   if (!_isAndroid15) return;
    //   _navBarMode = await NativeUtils.getNavigationBarInteractionMode();
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: widget.backgroundColorButton ?? Colors.transparent,
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        (widget.footer != null) ? 1.h : 2.5.h,
      ),
      child: Column(
        children: [
          AppButton(
            label: widget.labelSubmitButton,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (widget._formKey.currentState?.saveAndValidate() ?? false) {
                final data = widget._formKey.currentState?.value ?? {};
                widget.onSubmit.call(data);
              }
            },
          ),
          if (widget.footer != null) const SizedBox(height: 12),
          if (widget.footer != null) widget.footer!,
        ],
      ),
    );
  }
}
