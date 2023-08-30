import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:business_layout/business_layout.dart';

class MyUiConstApp {
  static const double myToolbarHeight = 35;
  static const double myHorizontalPaddingDouble = 9;
  static const double myTopPaddingDouble = 15;

  static const SizedBox myHorizontalSizedBox = SizedBox(
    width: myHorizontalPaddingDouble,
  );
  static const SizedBox myTopSizedBox = SizedBox(
    height: myTopPaddingDouble,
  );
  static final GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();
}
