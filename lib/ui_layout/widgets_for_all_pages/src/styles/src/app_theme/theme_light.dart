import 'package:flutter/material.dart';
import '../../styles.dart';

///______________________Theme Material Light__________________________________________________________________________________________________________________________________________

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight(BuildContext context) => ThemeData().copyWith(
      useMaterial3: true,
      primaryColor: ColorStyles.primaryColor,
      cardColor: ColorStylesLightTheme.myCardColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.white,
      ),
      scaffoldBackgroundColor: ColorStylesLightTheme.scaffoldBackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorStyles.primaryColor,
      ),
      appBarTheme: AppBarTheme().copyWith(
        titleTextStyle: myTextStyleFontOswald(
          fontSize: 20,
          context: context,
        ),
        iconTheme: IconThemeData().copyWith(
          color: ColorStylesLightTheme.borderColor,
          size: 20,
        ),
        color: ColorStylesLightTheme.myCardColor,
        elevation: 0,
        toolbarTextStyle: myTextStyleFontOswald(
          textColor: ColorStyles.primaryColor,
          context: context,
        ),
      ),
      cardTheme: const CardTheme(
        color: ColorStylesLightTheme.myCardColor,
        surfaceTintColor: Colors.transparent,
      ),
      bottomNavigationBarTheme:
          _bottomNavigationBarTheme(_themeLight.bottomNavigationBarTheme),
      textButtonTheme: TextButtonThemeData(
        style: const ButtonStyle().copyWith(
          foregroundColor: MaterialStateProperty.all(ColorStyles.primaryColor),
          textStyle: MaterialStateProperty.all(
            myTextStyleFontOswald(
              fontSize: 12,
              newFontWeight: FontWeight.w500,
              context: context,
            ),
          ),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          shadowColor: const MaterialStatePropertyAll(ColorStyles.primaryColor),
          overlayColor: MaterialStatePropertyAll(
              ColorStyles.primaryColor.withOpacity(0.1)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: const ButtonStyle().copyWith(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
          backgroundColor:
              const MaterialStatePropertyAll(ColorStyles.primaryColor),

          // foregroundColor: const MaterialStatePropertyAll(_myCardColorLight),
          textStyle: MaterialStatePropertyAll(
            myTextStyleFontOswald(
              fontSize: 18,
              newFontWeight: FontWeight.w500,
              context: context,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      textTheme: _textLight(
        _themeLight.textTheme,
        context: context,
      ),
    );

TextTheme _textLight(
  TextTheme baseTextThemeLight, {
  required BuildContext context,
}) {
//base - нащ базовый стиль
  return baseTextThemeLight.copyWith(
    /// b1
    titleLarge: myTextStyleFontOswald(
      fontSize: 20,
      textColor: ColorStylesLightTheme.myColorIsNotActive,
      newFontWeight: FontWeight.w500,
      context: context,
    ),

    /// b2
    titleMedium: myTextStyleFontOswald(
      textColor: ColorStylesLightTheme.myColorTextTwo,
      fontSize: 18,
      newFontWeight: FontWeight.w500,
      context: context,
    ),

    /// b3
    titleSmall: myTextStyleFontOswald(
      textColor: ColorStylesLightTheme.myColorTextThree,
      fontSize: 16,
      newFontWeight: FontWeight.w500,
      context: context,
    ),
//////////////////////////////////////////////
    /// b4
    bodyLarge: myTextStyleFontOswald(
      textColor: ColorStylesLightTheme.myColorIsNotActive,
      fontSize: 18,
      context: context,
    ),

    /// b5
    bodyMedium: myTextStyleFontOswald(
      textColor: ColorStylesLightTheme.myColorIsNotActive,
      fontSize: 16,
      newFontWeight: FontWeight.w400,
      context: context,
    ),

    /// c1
    bodySmall: myTextStyleFontOswald(
      textColor: ColorStylesLightTheme.myColorTextThree,
      fontSize: 14,
      newFontWeight: FontWeight.w300,
      context: context,
    ),

//////////////////////////////////////////////

    /// h1
    displayLarge: myTextStyleFontOswald(
      fontSize: 48,
      context: context,
    ),

    /// h2
    displayMedium: myTextStyleFontOswald(
      fontSize: 32,
      context: context,
    ),

    /// h3
    displaySmall: myTextStyleFontOswald(
      fontSize: 24,
      context: context,
    ),

    /// h4
    headlineLarge: myTextStyleFontOswald(
      fontSize: 18,
      context: context,
    ),

    /// h5
    headlineMedium: myTextStyleFontOswald(
      fontSize: 16,
      context: context,
    ),

    /// h6
    headlineSmall: myTextStyleFontOswald(
      fontSize: 14,
      context: context,
    ),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarTheme(
    BottomNavigationBarThemeData baseBottomNavigationBarThemeLight) {
  return baseBottomNavigationBarThemeLight.copyWith(
    backgroundColor: ColorStylesLightTheme.myCardColor,
    elevation: 0,
    unselectedItemColor: ColorStylesLightTheme.myColorIsNotActive,
    selectedItemColor: ColorStyles.primaryColor,
  );
}
