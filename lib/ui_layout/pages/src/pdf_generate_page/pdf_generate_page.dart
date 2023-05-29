import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:obrix/ui_layout/widgets_for_all_pages/widgets_for_all_pages.dart';

class PdfGeneratePage extends StatelessWidget {
  static const String id = '/pdf_generate_page';

  const PdfGeneratePage({Key? key, required this.croppedFile})
      : super(key: key);
  final CroppedFile? croppedFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (_) => HomePageBloc(),
      child: _PdfGeneratePage(
        croppedFile: croppedFile!,
      ),
    );
  }
}

class _PdfGeneratePage extends StatelessWidget {
  const _PdfGeneratePage({Key? key, required this.croppedFile});

  final CroppedFile croppedFile;

  Future<void> splitImageCreate(context) async {
    await Future.delayed(const Duration(milliseconds: 300), () async {
      print("Go splitImageCreate");
      final Uint8List imageInBytes = await croppedFile.readAsBytes();
      BlocProvider.of<HomePageBloc>(context).add(
        HomePageEvent.splitImageInPixeles(
          imageInBytes: imageInBytes,
          squareCountInColumn: 100,
          squareCountInRow: 100,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WrapperSceletonPage(
      child: Center(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state.isLoading) {
              splitImageCreate(context);
              return Center(
                child: Text(
                  "Дождитесь окончания загрузки...",
                  style: myTextStyleFontOswald(fontSize: 34),
                ),
              );
            } else {
              return state.splitImageModel.mapRowIndexAndListColor.isNotEmpty
                  ? SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.splitImageModel
                                  .mapRowIndexAndListColor.keys.length,
                              itemBuilder:
                                  (BuildContext context, int indexRow) {
                                return SizedBox(
                                  height: state.splitImageModel.sizePixel!
                                      .toDouble(),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: state
                                            .splitImageModel
                                            .mapRowIndexAndListColor[indexRow]
                                            ?.length ??
                                        0,
                                    itemBuilder: (BuildContext context,
                                        int indexColumn) {
                                      return Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Container(
                                          width: state
                                              .splitImageModel.sizePixel!
                                              .toDouble(),
                                          height: state
                                              .splitImageModel.sizePixel!
                                              .toDouble(),
                                          color: state.splitImageModel
                                                      .mapRowIndexAndListColor[
                                                  indexRow]?[indexColumn] ??
                                              Colors.black,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              "Разметка",
                              style: myTextStyleFontOswald(
                                  fontSize: 24, textColor: ColorStyles.black),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: state.splitImageModel
                                  .mapRowIndexAndListColor.keys.length,
                              itemBuilder:
                                  (BuildContext context, int indexRow) {
                                return SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: state
                                            .splitImageModel
                                            .mapRowIndexAndListColor[indexRow]
                                            ?.length ??
                                        0,
                                    itemBuilder: (BuildContext context,
                                        int indexColumn) {
                                      return Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Container(
                                          width: 50,
                                          height: 30,
                                          child: Text(
                                            "${indexRow}x${indexColumn}",
                                            style: myTextStyleFontOswald(
                                                textColor: ColorStyles.black),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Text("Ошибка...");
            }
          },
        ),
      ),
    );
  }
}
