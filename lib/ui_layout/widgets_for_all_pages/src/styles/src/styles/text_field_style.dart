import 'package:flutter/material.dart';
import 'color_styles.dart';
import 'text_style.dart';

InputDecoration myStyleTextField(
    BuildContext context, {
      String? labelText,
      String? hintText,
      String? helperText,
      Color? colorBorder,
      double? errorTextSize,
      bool isBorderColor = false,
      bool isFloatingLabelBehavior = true,
      Icon? iconLeading,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Widget? prefix,
    }) {
  OutlineInputBorder myOutlineInputBorder({Color? color}) => OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    gapPadding: 0,
    borderSide: BorderSide(
        color: color ?? Colors.transparent, width: color != null ? 1 : 0),
  );

  return InputDecoration(
    prefixIcon: iconLeading,
    // suffixIcon: ,
    suffixIcon: (prefix != null || suffixIcon != null)
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null)
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: prefix,
          ),
        if (suffixIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: suffixIcon,
          ),
      ],
    )
        : null,
    icon: prefixIcon,
    focusColor: Theme.of(context).primaryColor,
    // prefixIconColor: ColorStyles.blue,
    // prefixIconColor: ColorStyles.blue,
    hoverColor: Theme.of(context).cardColor.withOpacity(0.5),

    contentPadding: const EdgeInsets.fromLTRB(24, 16, 12, 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide.none,
    ),
    // isDense: true,
    //уменьшает высоту до минимальной

    enabledBorder: myOutlineInputBorder(color: colorBorder),
    floatingLabelBehavior: isFloatingLabelBehavior
        ? FloatingLabelBehavior.always
        : FloatingLabelBehavior.auto,

    focusedBorder: myOutlineInputBorder(color: Theme.of(context).primaryColor),
    errorBorder: myOutlineInputBorder(color: Colors.red),

    focusedErrorBorder: myOutlineInputBorder(color: Colors.red),

    errorStyle: myTextStyleFontOswald(
      textColor: Colors.red,
      fontSize: errorTextSize ?? 14,
      newFontWeight: FontWeight.w400,
      context: context,
    ),

    hintStyle: myTextStyleFontOswald(
      textColor: Theme.of(context).textTheme.titleSmall!.color,
      fontSize: 14,
      newFontWeight: FontWeight.w400,
      context: context,
    ),

    labelStyle: myTextStyleFontOswald(
      textColor: Theme.of(context).textTheme.titleSmall!.color,
      fontSize: 0,
      context: context,
      newFontWeight: FontWeight.w400,
    ),

    floatingLabelStyle: const TextStyle(fontSize: 0),

    labelText: labelText,
    helperText: helperText,
    hintText: hintText,
    //'123456',
    fillColor: Theme.of(context).cardColor,
    filled: true,
  );
}
