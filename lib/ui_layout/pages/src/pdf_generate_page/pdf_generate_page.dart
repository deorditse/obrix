import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:obrix/ui_layout/pages/pages.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';

import 'widgets/app.dart';

class NameColor {
  NameColor({
    required this.name,
    required this.colorInt,
    required this.imageData,
  });

  final String name;
  final int colorInt;
  List<int> imageData;
}

List<NameColor> pixelData = [
  NameColor(name: 'I', colorInt: 0xFF9dc2e4, imageData: []),
  NameColor(name: 'L', colorInt: 0xFFa0a7b1, imageData: []),
  NameColor(name: 'A', colorInt: 0xFF80858b, imageData: []),
  NameColor(name: 'E', colorInt: 0xFF697375, imageData: []),
  NameColor(name: 'W', colorInt: 0xFF262d37, imageData: []),
];

class PdfGeneratePage extends StatelessWidget {
  static const String id = '/pdf_generate_page';

  const PdfGeneratePage({Key? key}) : super(key: key);

  void splitImageCreate(BuildContext context,
      {required Future<Uint8List> readAsBytes}) {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        BlocProvider.of<QbrixBloc>(context)
            .add(QbrixEvent.splitImageInPixelsNew(readAsBytes: readAsBytes));
      },
    );
  }

  Future<List<NameColor>> generateList() async {
    List<NameColor> _list = [];
    for (var pixel in pixelData) {
      int index = pixelData.indexOf(pixel);
      final _res = await rootBundle.load('assets/puzzle/${pixel.name}.png');
      _list.add(
        NameColor(
          name: pixelData[index].name,
          colorInt: pixelData[index].colorInt,
          imageData: _res.buffer.asUint8List(),
        ),
      );
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return WrapperSceletonPage(
      isPadding: false,
      child: Center(
        child: BlocConsumer<QbrixBloc, QbrixState>(
          listener: (context, state) {},
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
            if (state.croppedFile == null && state.isLoading) {
              Navigator.pop(context);
            }
            if (state.isLoading) {
              return const Center(
                child: AnimatedIconDeveloper(
                  text: "Генерирую инструкцию...",
                ),
              );
            } else {
              return state.splitImageModel.mapRowIndexAndListColor.isNotEmpty
                  ? FutureBuilder<List<NameColor>>(
                      future: generateList(),
                      builder: (context, data) {
                        if (data.hasData) {
                          return MyApp(
                            splitImageModel: state.splitImageModel,
                            pixelData: data.data!,
                          );
                        } else {
                          return const MyCircularProgressIndicator();
                        }
                      },
                    )
                  : const Text("Ошибка...Попробуйте позже");
            }
          },
        ),
      ),
    );
  }
}
