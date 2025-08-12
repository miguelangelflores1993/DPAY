// import 'package:app/core/ui/theme/app_colors.dart';
// import 'package:app/core/ui/widgets/atoms/buttons/app_button.dart';
// import 'package:app/core/ui/widgets/atoms/textfield/app_text_field.dart';
// import 'package:app/modules/auth/presentation/pages/extra_register/widgets/pet_selector_widget.dart';
// import 'package:app/shared/components/app_adaptive_image.dart';
// import 'package:app/shared/components/bar_gradient.dart';
// import 'package:app/shared/components/selector_widget.dart';
// import 'package:app/shared/components/stepper_widget.dart';
// import 'package:app/shared/constants/app_images.dart';
// import 'package:datec_latam_translations/datec_latam_translations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:sizer/sizer.dart';

// class ExtraRegisterPage extends StatefulWidget {
//   const ExtraRegisterPage({super.key});

//   @override
//   State<ExtraRegisterPage> createState() => _ExtraRegisterPageState();
// }

// class _ExtraRegisterPageState extends State<ExtraRegisterPage> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   String selectedPet = '';
//   int childrenCount = 0;

//   final List<String. genderOptions = {
//     '01': AppStrings.male,
//     '02': AppStrings.female,
//     '03': AppStrings.other,
//   };

//   List<String> selectedInterests = [];
//   final Map<String, String> interests = {
//     '01': AppStrings.food,
//     '02': AppStrings.events,
//     '03': AppStrings.fashion,
//     '04': AppStrings.home,
//     '05': AppStrings.beauty,
//     '06': AppStrings.toys,
//     '07': AppStrings.sports,
//     '08': AppStrings.food,
//     '09': AppStrings.drinks,
//   };

//   List<String> selectedStyle = [];
//   final Map<String, String> styles = {
//     '01': AppStrings.styleCasual,
//     '02': AppStrings.styleFormal,
//     '03': AppStrings.styleUrban,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       bottom: false,
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 10,
//           children: [
//             Center(
//               child: Text(
//                 AppStrings.register,
//                 style: TextStyle(
//                   fontSize: 21.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 0.5.h),
//             Row(
//               spacing: 5,
//               children: [
//                 AppAdaptiveImage(AppImages.gift, width: 4.5.w),
//                 Text(
//                   AppStrings.freeGift('Bs.50'),
//                   style: TextStyle(
//                     fontSize: 17.5.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               AppStrings.almostFinish,
//               style: TextStyle(
//                 fontSize: 15.6.sp,
//                 color: const Color(0xFF61677D),
//               ),
//             ),

//             DynamicGradientBar(
//               value: 0.75,
//               height: 1.h,
//               startColor: const Color(0xF0FF5F00),
//               endColor: const Color(0xFFFFA400),
//               borderRadius: BorderRadius.circular(8),
//               backgroundColor: Colors.grey.shade300,
//             ),

//             Text(
//               AppStrings.lastStep,
//               style: TextStyle(fontSize: 16.sp, color: const Color(0xFF61677D)),
//             ),

//             ///FORM
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               spacing: 20,
//               children: [
//                 FormBuilder(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       AppTextField.date(
//                         context: context,
//                         name: 'birthDate',
//                         topLabelText: AppStrings.yourBirthday,
//                         hintText: 'DD/MM/AAAA',
//                       ),
//                       AppTextField.selector(
//                         context: context,
//                         name: 'gender',
//                         topLabelText: AppStrings.yourGender,
//                         hintText: AppStrings.hintGender,
//                         items: genderOptions,
//                       ),
//                     ],
//                   ),
//                 ),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     StepperWidget(
//                       text: AppStrings.haveChildren,
//                       count: childrenCount,
//                       onIncrement: () {
//                         setState(() {});
//                         childrenCount++;
//                       },
//                       onDecrement: () {
//                         setState(() {});
//                         childrenCount--;
//                       },
//                     ),
//                     PetSelector(
//                       selectedPet: selectedPet,
//                       onChanged: (value) {
//                         setState(() {});
//                         selectedPet = value;
//                       },
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 5),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     spacing: 15,
//                     children: [
//                       Text(
//                         AppStrings.selectInterests,
//                         style: TextStyle(fontSize: 16.sp),
//                       ),

//                       SelectorWidget(
//                         options: interests,
//                         selectedOptions: selectedInterests,
//                         onSelectionChanged: (selectedOptions) {
//                           setState(() {});
//                           selectedInterests = selectedOptions;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     spacing: 15,
//                     children: [
//                       Text(
//                         AppStrings.howStyle,
//                         style: TextStyle(fontSize: 16.sp),
//                       ),

//                       SelectorWidget(
//                         options: styles,
//                         selectedOptions: selectedStyle,
//                         onSelectionChanged: (selectedOptions) {
//                           setState(() {});
//                           selectedStyle = selectedOptions;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             ///ACTIONS
//             SizedBox(height: 1.5.h),

//             AppButton(
//               label: AppStrings.finishRegister,
//               height: 6.h,
//               textStyle: const TextStyle(fontWeight: FontWeight.w500),
//               onPressed: () {
//                 if (!_formKey.currentState!.validate()) return;
//                 // final formData = _formKey.currentState!.fields;
//                 // final birthDate = formData['birthDate']?.value;
//                 // final gender = formData['gender']?.value;
//                 // final interests = selectedInterests;
//                 // final style = selectedStyle;
//                 // final children = childrenCount;
//                 // final pet = selectedPet;
//               },
//             ),

//             AppButton(
//               label: AppStrings.skipStep,
//               height: 6.h,
//               onPressed: () {
//                 // Handle continue action
//               },
//               textStyle: const TextStyle(fontWeight: FontWeight.w500),
//               backgroundColor: Colors.white,
//               foregroundColor: AppColors.primaryAccentColor,
//               border: const BorderSide(
//                 color: AppColors.primaryAccentColor,
//                 width: 1.5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
