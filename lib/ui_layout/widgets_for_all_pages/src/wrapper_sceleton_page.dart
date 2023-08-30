import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/color_styles.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';

class WrapperSceletonPage extends StatelessWidget {
  const WrapperSceletonPage({
    Key? key,
    required this.child,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);
  final Widget child;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        title: Text(
          "QBRIX",
          style: myTextStyleFontOswald(
            fontSize: 24,
            context: context,
          ),
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
