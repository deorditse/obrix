import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/color_styles.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/src/styles/src/styles/text_style.dart';

class WrapperSceletonPage extends StatelessWidget {
  const WrapperSceletonPage({
    Key? key,
    required this.child,
    this.resizeToAvoidBottomInset = true,
    this.isPadding = true,
  }) : super(key: key);
  final Widget child;
  final bool isPadding;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, kToolbarHeight),
        child: BlocBuilder<QbrixBloc, QbrixState>(
          builder: (context, state) {
            final String? nameFormat = state.splitImageModel.formatImage?.name;
            return AppBar(
              title: Text(
                "QBRIX ${nameFormat != null ? ' | ${nameFormat.toUpperCase()}' : ''}",
                style: myTextStyleFontOswald(
                  fontSize: 24,
                  context: context,
                ),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: isPadding
                ? const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  )
                : EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
