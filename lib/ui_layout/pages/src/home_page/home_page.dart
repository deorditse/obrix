import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';
import 'widgets/crop_image.dart';
import 'widgets/select_start_parameters.dart';

class HomePage extends StatelessWidget {
  static const String id = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperSceletonPage(
      child: BlocBuilder<QbrixBloc, QbrixState>(
        builder: (context, state) => state.imagePath != null
            ? CropImage(imagePath: state.imagePath!)
            : const SelectParameters(),
      ),
    );
  }
}
