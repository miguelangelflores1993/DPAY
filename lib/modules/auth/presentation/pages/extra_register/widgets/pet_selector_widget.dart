import 'package:app/shared/components/app_adaptive_image.dart';
import 'package:app/shared/constants/app_images.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PetSelector extends StatefulWidget {
  const PetSelector({required this.selectedPet, this.onChanged, super.key});

  final String selectedPet;
  final ValueChanged<String>? onChanged;

  @override
  State<PetSelector> createState() => _PetSelectorState();
}

class _PetSelectorState extends State<PetSelector> {
  late String _selectedPet;

  @override
  void initState() {
    super.initState();
    _selectedPet = widget.selectedPet;
  }

  void _onPetSelected(String pet) {
    setState(() {});
    _selectedPet = pet;
    widget.onChanged?.call(pet);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: Column(
        spacing: 8,
        children: [
          Text(AppStrings.havePets, style: TextStyle(fontSize: 16.sp)),
          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PetOption(
                image: AppImages.dog,
                isSelected: _selectedPet == 'dog',
                onTap: () => _onPetSelected('dog'),
              ),
              PetOption(
                image: AppImages.cat,
                isSelected: _selectedPet == 'cat',
                onTap: () => _onPetSelected('cat'),
              ),
              PetOption(
                image: AppImages.notApply,
                isSelected: _selectedPet == 'not_apply',
                onTap: () => _onPetSelected('not_apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PetOption extends StatelessWidget {
  const PetOption({
    required this.image,
    required this.isSelected,
    this.onTap,
    super.key,
  });

  final String image;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 10.5.w,
            height: 10.5.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? const Color(0xFFFF7622) : Colors.transparent,
                width: 2,
              ),
            ),
            child: Center(
              child: AppAdaptiveImage(image, width: 5.5.w),
            ),
          ),

          if (isSelected)
            Positioned(
              top: -5,
              right: -5,
              child: Container(
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 0.5),
                ),
                child: Icon(
                  Icons.check_circle,
                  color: const Color(0xFFFF7622),
                  size: 4.5.w,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
