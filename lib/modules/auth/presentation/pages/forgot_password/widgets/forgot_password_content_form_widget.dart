import 'package:app/core/ui/widgets/atoms/textfield/app_text_field.dart';
import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:app/shared/constants/responsive_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ForgotPasswordContentFormWidget extends StatefulWidget {
  const ForgotPasswordContentFormWidget({super.key});

  @override
  State<ForgotPasswordContentFormWidget> createState() => _ForgotPasswordContentFormWidgetState();
}

class _ForgotPasswordContentFormWidgetState extends State<ForgotPasswordContentFormWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2.h,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 5,
              right: 20,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                AppAdaptiveImage(
                  AppImages.logo01,
                  width: ResponsiveSize.getSize(
                    mobile: 35.w,
                    tablet: TabletSize(
                      portrait: 22.5.w,
                      horizontal: 15.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 1.5.h,
              children: [
                Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(
                    fontSize: ResponsiveSize.getSize(
                      mobile: 19.sp,
                      tablet: TabletSize(
                        portrait: 17.sp,
                        horizontal: 15.sp,
                      ),
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  AppStrings.forgotPasswordSubtitle,
                  style: TextStyle(
                    fontSize: ResponsiveSize.getSize(
                      mobile: 16.sp,
                      tablet: TabletSize(
                        portrait: 14.sp,
                        horizontal: 12.sp,
                      ),
                    ),
                    color: const Color(0xFF6B6C7E),
                    fontWeight: FontWeight.w400,
                  ),
                ),

                AppTextField.required(
                  context: context,
                  name: 'email',
                  labelText: AppStrings.email,
                  hintText: AppStrings.hintEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconLocationWidget extends StatelessWidget {
  const IconLocationWidget({
    required this.selectedName,
    required this.image,
    required this.name,
    required this.onTap,
    super.key,
  });

  final String selectedName;
  final String image;
  final String name;
  final void Function(String name) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => onTap.call(name),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: selectedName == name ? const Color(0xFFFF9500) : Colors.transparent,
            ),
          ),
          child: AppAdaptiveImage(
            image,
            width: 5.5.w,
          ),
        ),
      ),
    );
  }
}

class EditableAvatar extends StatelessWidget {
  const EditableAvatar({
    required this.imageUrl,
    required this.onEdit,
    super.key,
  });
  final String imageUrl;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de usuario
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),

        // Ícono de editar
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.edit_square,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
