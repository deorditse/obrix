import 'package:flutter/material.dart';
import '../../styles.dart';
import '../styles/color_styles.dart';
import '../styles/text_style.dart';

///______________________Theme Material Light__________________________________________________________________________________________________________________________________________

//for Light theme
ThemeData _themeLight = ThemeData.light();
// ThemeData _themeLight =
//     ThemeData(fontFamily: FontFamilyName.SBSansDisplayRegular.toString());

ThemeData themeLight = ThemeData(fontFamily: "SBSansDisplay").copyWith(
  scaffoldBackgroundColor: ColorStyles.backgroundAppColor,
  backgroundColor: ColorStyles.backgroundAppColor,
  primaryColor: ColorStyles.blue,
  cardColor: ColorStyles.white,
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  // primaryColor: myColorIsActive,
  // cardColor: myColorIsActive,
  // scaffoldBackgroundColor: Color.fromRGBO(245, 248, 255, 1),
  // appBarTheme: AppBarTheme(
  //   titleTextStyle: myTextStyleFontS8Sans(fontSize: 20, context: null),
  //   toolbarHeight: 40,
  //   elevation: 0,
  //   color: Colors.transparent,
  //   iconTheme: IconThemeData(size: 20),
  // ),
  //
  textButtonTheme: TextButtonThemeData(
    style: const ButtonStyle().copyWith(
      // tapTargetSize: MaterialTapTargetSize.shrinkWrap,

      // backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStateProperty.all(ColorStyles.blue),
      textStyle: MaterialStateProperty.all(
        myTextStyleFontOswald(
          fontSize: 14,
          newFontWeight: FontWeight.w500,
        ),
      ),

      padding:
          const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      shadowColor: const MaterialStatePropertyAll(Colors.red),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: const ButtonStyle().copyWith(
      elevation: MaterialStateProperty.all(0),

      padding: MaterialStateProperty.all(
        const EdgeInsets.all(16),
      ),
      backgroundColor: MaterialStatePropertyAll(ColorStyles.blue),

      // foregroundColor: const MaterialStatePropertyAll(_myCardColorLight),
      textStyle: MaterialStateProperty.all(
        myTextStyleFontOswald(
          textColor: ColorStyles.white,
          fontSize: 14,
        ),
      ),
      overlayColor:
          const MaterialStatePropertyAll(Color.fromRGBO(0, 0, 0, 0.2)),
      // overlayColor: const MaterialStatePropertyAll(ColorStyles.blueDark),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    ),
  ),

  textTheme: _textLight(_themeLight.textTheme),
  //_themeLight.textTheme - какую базу будем перезаписывать
);

TextTheme _textLight(TextTheme baseTextThemeLight) {
//base - нащ базовый стиль
  return baseTextThemeLight.copyWith(
    /// h1
    displayLarge: myTextStyleFontOswald(
      fontSize: 48,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),

    /// h2
    displayMedium: myTextStyleFontOswald(
      fontSize: 32,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),

    /// h3
    displaySmall: myTextStyleFontOswald(
      fontSize: 24,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),

    /// h4
    headlineLarge: myTextStyleFontOswald(
      fontSize: 18,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),

    /// h5
    headlineMedium: myTextStyleFontOswald(
      fontSize: 16,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),

    /// h6
    headlineSmall: myTextStyleFontOswald(
      fontSize: 14,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),

    /// b1
    titleLarge: myTextStyleFontOswald(
      fontSize: 18,
    ),

    /// b2
    titleMedium: myTextStyleFontOswald(
      fontSize: 16,
      newFontWeight: FontWeight.w400,
    ),

    /// b3
    titleSmall: myTextStyleFontOswald(
      fontSize: 14,
      newFontWeight: FontWeight.w400,
    ),

    /// b4
    bodyLarge: myTextStyleFontOswald(
      fontSize: 12,
      newFontWeight: FontWeight.w400,
    ),

    /// b5
    bodyMedium: myTextStyleFontOswald(
      fontSize: 10,
      newFontWeight: FontWeight.w400,
    ),

    /// c1
    bodySmall: myTextStyleFontOswald(
      fontSize: 12,
      newFontFamilyName: FontFamilyName.SBSansDisplaySemiBold,
    ),
  );
}
