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

    late int segmentWidth;
    late int segmentHeight;
    late int countSegmentsInRow;
    late int countSegmentsInColumn;
    late Size _sizePixel;

    final Uint8List _bytes = await readAsBytes;
    img.Image image = img.grayscale(img.decodeImage(_bytes)!);

    //А4 состоит из 81 сегмента (шириной 19 и высотой 13).
    // Итого ширина: 9*9 = 81
    // высота 9*13 = 117

    // Привет. А3 состоит из 117 сегментов (шириной 13 и высотой 12), и еще 9 сегментов (шириной 13 и 10 высотой).
    //
    // Итого ширина: 9*13 = 117
    // высота 13*12 + 10 = 166
    switch (state.splitImageModel.formatImage) {
      case FormatImage.a4:
        segmentWidth = 9;
        segmentHeight = 13;
        countSegmentsInRow = 9;
        countSegmentsInColumn = 9;
        _sizePixel = Size(
          image.width / (segmentWidth * countSegmentsInRow),
          image.height / (segmentHeight * countSegmentsInColumn),
        );
      case FormatImage.a3:
      default:
        segmentWidth = 13;
        segmentHeight = 12;
        countSegmentsInRow = 9;
        countSegmentsInColumn = 14;
        // для нижних сегментов countPixelsInSegmentColumn = 10;
        _sizePixel = Size(
          image.width / (segmentWidth * countSegmentsInRow),
          image.height / (segmentHeight * countSegmentsInColumn - 3),
        );
    }

    Map<int, List<Color>> _pixelsImageInGrey = {};

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

      _pixelsImageInGrey[indexRow] = rowListColor;
      indexRow += 1;
    }

    ///делю нарезанные пиксели на сегменты
    ///indexSegment : indexRowSegment : List pixels color HEX
    Map<int, Map<int, List<Color>>>
        indexSegmentToIndexRowSegmentAndListPixelsColorHex = {};
    int segmentIndex = 0;
    for (int rowIndex = 0;
        rowIndex < _pixelsImageInGrey.length;
        rowIndex += segmentHeight) {
      Map<int, List<Color>> segmentRows = {};
      for (int i = rowIndex; i < rowIndex + segmentHeight; i++) {
        segmentRows[i - rowIndex] = _pixelsImageInGrey[i] ?? [];
      }
      indexSegmentToIndexRowSegmentAndListPixelsColorHex[segmentIndex] =
          segmentRows;
      segmentIndex++;
    }

    emit(
      state.copyWith(
        isLoading: false,
        splitImageModel: state.splitImageModel.copyWith(
          mapRowIndexAndListColor: _pixelsImageInGrey,
          indexSegmentToIndexRowSegmentAndListPixelsColorHex:
              indexSegmentToIndexRowSegmentAndListPixelsColorHex,
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
