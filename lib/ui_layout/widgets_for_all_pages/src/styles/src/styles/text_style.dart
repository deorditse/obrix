import 'package:flutter/material.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/styles.dart';

// const String SBSansTextRegularPath =
//     "packages/common_solutions_for_different_services/assets_for_all_services/fonts/SBSansText/OT_TTF/SBSansTextRegular.ttf";
// const String SBSansDisplaySemiBoldPath =
//     "packages/common_solutions_for_different_services/assets_for_all_services/fonts/SBSansDisplay/TTF/SBSansDisplaySemiBold.ttf";
// const String SBSansDisplayBoldPath =
//     "packages/common_solutions_for_different_services/assets_for_all_services/fonts/SBSansDisplay/TTF/SBSansDisplayBold.ttf";

const String SBSansTextRegularPath = "Oswald";
const String SBSansDisplaySemiBoldPath = "Oswald";
const String SBSansDisplayBoldPath = "Oswald";

enum FontFamilyName {
  SBSansTextRegular,
  SBSansDisplaySemiBold,
  SBSansDisplayBold,
}

String _getPathFont({required FontFamilyName fontFamilyName}) {
  switch (fontFamilyName) {
    case FontFamilyName.SBSansTextRegular:
      return SBSansTextRegularPath;
    case FontFamilyName.SBSansDisplaySemiBold:
      return SBSansDisplaySemiBoldPath;
    case FontFamilyName.SBSansDisplayBold:
      return SBSansDisplayBoldPath;
    default:
      return SBSansTextRegularPath;
  }
}

TextStyle myTextStyleFontOswald({
  double? fontSize,
  Color? textColor,
  TextDecoration? decoration,
  FontWeight? newFontWeight,
  FontFamilyName newFontFamilyName = FontFamilyName.SBSansTextRegular,
  required BuildContext context,
}) {
  return TextStyle(
    color: textColor ?? Theme.of(context).textTheme.titleLarge!.color!,
    fontFamily: _getPathFont(fontFamilyName: newFontFamilyName),
    fontSize: fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize,
    fontWeight: newFontWeight ?? FontWeight.w400,
    decoration: decoration,
    // overflow: TextOverflow.ellipsis,
  );
}
