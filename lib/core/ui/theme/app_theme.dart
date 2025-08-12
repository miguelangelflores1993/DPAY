import 'package:app/core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static InputBorder customInput(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1.2),
    );
  }

  static ThemeData lightTheme = ThemeData(
    fontFamily: AppColors.fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    splashColor: Colors.grey.withValues(alpha: 0.2),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
      surface: AppColors.backgroundColor,
      // onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textColor,
      // onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.2,
      ),
      labelLarge: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
      ),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.textColor,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
        overlayColor: WidgetStateProperty.all(
          Colors.black.withValues(alpha: 0.1),
        ),
        elevation: WidgetStateProperty.all(0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          const BorderSide(color: AppColors.borderColor),
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.textColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // foregroundColor: WidgetStateProperty.all(primaryColor),
        overlayColor: WidgetStateProperty.all(
          Colors.black.withValues(alpha: 0.1),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: const TextStyle(
        color: AppColors.mutedTextColor,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: customInput(AppColors.borderColor),
      focusedBorder: customInput(AppColors.primaryColor),
      errorBorder: customInput(AppColors.errorColor),
      focusedErrorBorder: customInput(AppColors.errorColor),
    ),
    cardTheme: CardThemeData(
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      margin: const EdgeInsets.all(8),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.all(
        Colors.white,
      ), // Color de la marca de verificación
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => states.contains(WidgetState.selected) ? AppColors.primaryColor : Colors.white,
      ),
      side: const BorderSide(
        color: Color(0xFF6B6C7E),
        width: 1.5,
      ), // Color del borde cuando no está seleccionado
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    dividerColor: AppColors.borderColor,
    listTileTheme: const ListTileThemeData(
      visualDensity: VisualDensity.standard,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      titleTextStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
        color: Colors.black,
        fontFamily: AppColors.fontFamily,
        fontWeight: FontWeight.w300,
      ),
    ),

    popupMenuTheme: const PopupMenuThemeData(
      position: PopupMenuPosition.under,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 0.15,
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE7E7ED),
      thickness: 1,
    ),
  );
}

// static ThemeData darkTheme = ThemeData(
//   fontFamily: 'NotoSans',
//   brightness: Brightness.dark,
//   primaryColor: primaryColor,
//   scaffoldBackgroundColor: darkBgColor,
//   cardColor: darkCardColor,
//   dividerColor: lightGrayColor,
//   colorScheme: const ColorScheme.dark(
//     primary: primaryColor,
//     primaryContainer: lightGrayColor,
//     secondaryContainer: darkTurquoise,
//     surface: darkCardColor,
//     error: Colors.red,
//     onPrimary: darkTextColor,
//     onSecondary: whiteColor,
//     onSurface: darkTextColor,
//     onError: whiteColor,
//   ),
//   listTileTheme: const ListTileThemeData(
//     tileColor: darkCardColor,
//     textColor: whiteColor,
//     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//   ),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(color: darkTextColor),
//     bodyMedium: TextStyle(color: darkTextColor),
//     displayLarge: TextStyle(color: darkTextColor),
//     displayMedium: TextStyle(color: darkTextColor),
//     displaySmall: TextStyle(color: darkTextColor),
//   ),
//   appBarTheme: const AppBarTheme(
//     backgroundColor: darkBgColor,
//     foregroundColor: darkTextColor,
//     centerTitle: true,
//   ),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: primaryColor,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: WidgetStateProperty.all(primaryColor),
//       foregroundColor: WidgetStateProperty.all(darkTextColor),
//       shape: WidgetStateProperty.all(
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: darkCardColor,
//     hintStyle: const TextStyle(color: lightGrayColor),
//     enabledBorder: customInput(lightGrayColor),
//     focusedBorder: customInput(primaryColor),
//     errorBorder: customInput(Colors.red),
//     focusedErrorBorder: customInput(Colors.red),
//   ),
// );
