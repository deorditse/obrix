import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:logger/logger.dart';
import 'package:models/models.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:ui' as ui;

part 'qbrix_event.dart';

part 'qbrix_state.dart';

///for freezed
part 'qbrix_bloc.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
class QbrixBloc extends Bloc<QbrixEvent, QbrixState> {
  QbrixBloc() : super(const QbrixState()) {
    on<QbrixEvent>(
      (QbrixEvent event, _) {
        event.when<void>(
          splitImageInPixeles: _splitImageInPixeles,
          clearAll: _clearAll,
          pickNewImagePath: _pickNewImagePath,
          addCroppedImage: _addCroppedImage,
          selectCropFormat: _selectCropFormat,
        );
      },
    );
  }

  Future<void> _splitImageInPixeles(
    Future<Uint8List> readAsBytes,
  ) async {
    log("qbrix_bloc _splitImageInPixeles");

    emit(state.copyWith(isLoading: true));

    late int countPixelsColumn;
    late int countPixelsRow;
    late int countSegmentsRow;
    late int countSegmentsColumn;

    ///для формата A3
    switch (state.splitImageModel.formatImage) {
      case FormatImage.a4:
        countPixelsColumn = 117;
        countPixelsRow = 81;
        countSegmentsRow = 9;
        countSegmentsColumn = 13;
      case FormatImage.a3:
      default:
        countPixelsColumn = 166;
        countPixelsRow = 117;
        countSegmentsRow = 9;
        countSegmentsColumn = 14;
    }
    final Uint8List _bytes = await readAsBytes;

    img.Image image = img.grayscale(img.decodeImage(_bytes)!);
    // img.Image image = img.decodeImage(_bytes)!;

    Size _sizePixel =
        Size(image.width / countPixelsRow, image.height / countPixelsColumn);

    Map<int, List<Color>> pixelsImageInGrey = {};

    ///1 Нарезаю картинку на пиксели
    int indexRow = 0;
    for (var y = 0; y < image.height; y += _sizePixel.height.toInt()) {
      List<Color> rowListColor = [];
      for (var x = 0; (x < image.width); x += _sizePixel.width.toInt()) {
        final img.Image imagePixel = img.copyCrop(
          image,
          x: x,
          y: y,
          width: _sizePixel.width.toInt(),
          height: _sizePixel.height.toInt(),
        );

        final Color valueColor = await getMainPuzzleColor(image: imagePixel);

        rowListColor.add(valueColor);
      }

      pixelsImageInGrey[indexRow] = rowListColor;
      indexRow += 1;
    }

    //А4 состоит из 81 сегмента (шириной 19 и высотой 13).
    // Итого ширина: 9*9 = 81
    // высота 9*13 = 117

    // Привет. А3 состоит из 117 сегментов (шириной 13 и высотой 12), и еще 9 сегментов (шириной 13 и 10 высотой).
    //
    // Итого ширина: 9*13 = 117
    // высота 13*12 + 10 = 166

    ///indexSegment : indexRowSegment : List pixels color hex
    // Map<int, Map<int, List<String>>>
    //     indexSegmentToIndexRowSegmentAndListPixelsColorHex = {};
    //
    // img.Image image = img.grayscale(img.decodeImage(_bytes)!);

    // ///проходимся по всем сегментам
    // for (int indexSegmentRow = 1;
    //     indexSegmentRow <= countSegmentsRow;
    //     indexSegmentRow++) {
    //   for (int indexSegmentRow = 1;
    //       indexSegmentRow <= countSegmentsRow;
    //       indexSegmentRow++) {
    //     /// проход по сегментам
    //   }
    // }

    emit(
      state.copyWith(
        isLoading: false,
        splitImageModel: state.splitImageModel.copyWith(
          mapRowIndexAndListColor: pixelsImageInGrey,
          squareCountInRow: countSegmentsColumn,
          squareCountInColumn: countPixelsColumn,
          sizePixel: _sizePixel,
          sizeImage: Size(image.width.toDouble(), image.height.toDouble()),
        ),
      ),
    );
  }

  void _clearAll() {
    log("qbrix_bloc _clearAll");

    emit(const QbrixState());
  }

  void _pickNewImagePath(String imagePath) {
    log("qbrix_bloc _pickNewImagePath");

    emit(state.copyWith(imagePath: imagePath));
  }

  void _addCroppedImage(CroppedFile croppedFile) {
    log("qbrix_bloc _addCroppedImage");

    emit(state.copyWith(
      croppedFile: croppedFile,
    ));
  }

  void _selectCropFormat(FormatImage? formatImage) {
    log("qbrix_bloc _selectCropFormat");
    emit(
      QbrixState(
        splitImageModel: state.splitImageModel.copyWith(
          formatImage: formatImage,
        ),
      ),
    );
  }
}

Future<Color> getMainPuzzleColor({required img.Image image}) async {
  PaletteGenerator _paletteGenerator = await PaletteGenerator.fromByteData(
    EncodedImage(
      image.buffer.asByteData(),
      // ByteData.view(image.getBytes().buffer),
      height: image.width,
      width: image.height,
    ),
    maximumColorCount: 4,
  );
  Color dominantColor = _paletteGenerator.dominantColor?.color ??
      _paletteGenerator.vibrantColor?.color ??
      _paletteGenerator.mutedColor?.color ??
      Colors.black;
  log("qbrix_bloc getMainPuzzleColor ${dominantColor.toString()}");

  // double hue = dominantColor.computeLuminance();
  // if (hue >= 0 && hue < 45) {
  //   _primaryColor = Colors.red;
  // } else if (hue >= 45 && hue < 135) {
  //   _primaryColor = Colors.green;
  // } else if (hue >= 135 && hue < 225) {
  //   _primaryColor = Colors.blue;
  // } else if (hue >= 225 && hue < 315) {
  //   _primaryColor = Colors.yellow;
  // } else {
  //   _primaryColor = Colors.red;
  // }

  return dominantColor;
}
