import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';

import 'widgets/app.dart';

class PdfGeneratePage extends StatelessWidget {
  static const String id = '/pdf_generate_page';

  const PdfGeneratePage({Key? key}) : super(key: key);

  void splitImageCreate(BuildContext context,
      {required Future<Uint8List> readAsBytes}) {
    Future.delayed(const Duration(milliseconds: 300), () {
      BlocProvider.of<QbrixBloc>(context).add(
        QbrixEvent.splitImageInPixelsNew(readAsBytes: readAsBytes),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WrapperSceletonPage(
      child: Center(
        child: BlocBuilder<QbrixBloc, QbrixState>(
          builder: (context, state) {
            if (state.croppedFile != null &&
                state.splitImageModel.mapRowIndexAndListColor.isEmpty) {
              print(
                  'tate.croppedFile != null && state.splitImageModel.mapRowIndexAndListColor.isEmpty | tate.croppedFile != null && state.splitImageModel.mapRowIndexAndListColor.isEmpty');
              splitImageCreate(
                context,
                readAsBytes: state.croppedFile!.readAsBytes(),
              );
            }
            if (state.isLoading) {
              return const Center(
                child: AnimatedIconDeveloper(
                  text: "Генерирую инструкцию...",
                ),
              );
            } else {
              return state.splitImageModel.mapRowIndexAndListColor.isNotEmpty
                  ? MyApp(splitImageModel: state.splitImageModel)
                  : const Text("Ошибка...");
            }
          },
        ),
      ),
    );
  }
}
