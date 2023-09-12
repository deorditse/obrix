import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper_for_web/image_cropper_for_web.dart';
import 'package:models/models.dart';
import 'package:palette_generator/palette_generator.dart';

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
          // splitImageInPixeles: _splitImageInPixeles,
          clearAll: _clearAll,
          pickNewImagePath: _pickNewImagePath,
          addCroppedImage: _addCroppedImage,
          selectCropFormat: _selectCropFormat,
          splitImageInPixelsNew: _splitImageInPixelsNew,
        );
      },
    );
  }

  Future<void> _splitImageInPixelsNew(Future<Uint8List> readAsBytes) async {
    try {
      log("qbrix_bloc _splitImageInPixeles");

      emit(state.copyWith(isLoading: true));

      late int kSegmentsWidth;
      late int kSegmentsHeight;
      late int countSegmentsInRow;
      late int countSegmentsInColumn;
      late material.Size _sizePixel;

      final Uint8List _bytes = await readAsBytes;
      img.Image image = img.grayscale(img.decodeImage(_bytes)!);

      //А4 состоит из 81 сегмента (шириной 9 и высотой 13).
      // Итого ширина: 9*9 = 81
      // высота 9*13 = 117

      // Привет. А3 состоит из 117 сегментов (шириной 13 и высотой 12), и еще 9 сегментов (шириной 13 и 10 высотой).
      //
      // Итого ширина: 9*13 = 117
      // высота 13*12 + 10 = 166
      switch (state.splitImageModel.formatImage) {
        case FormatImage.a4:
          kSegmentsWidth = 9;
          kSegmentsHeight = 13;
          countSegmentsInRow = 9;
          countSegmentsInColumn = 9;
          _sizePixel = material.Size(
            (image.width).toInt() / (kSegmentsWidth * countSegmentsInRow),
            (image.height).toInt() / (kSegmentsHeight * countSegmentsInColumn),
          );
        case FormatImage.a3:
        default:
          kSegmentsWidth = 13;
          kSegmentsHeight = 12;
          countSegmentsInRow = 9;
          countSegmentsInColumn = 14;
          // для нижних сегментов countPixelsInSegmentColumn = 10;
          _sizePixel = material.Size(
            (image.width).toInt() / (kSegmentsWidth * countSegmentsInRow),
            (image.height).toInt() / (kSegmentsHeight * countSegmentsInColumn),
          );
      }

      ////_______________________________________________________________________________________________
      //// Все пиксели картинки
      ////_______________________________________________________________________________________________

      //индекс строки и пиксели в этой строке
      Map<int, List<int>> _pixelsImageInGrey = await _generatePixelsSegment(
        image: image,
        sizePixel: _sizePixel,
      );

      ////_______________________________________________________________________________________________
      //// Разбиение на сегменты
      ////_______________________________________________________________________________________________

      double heightSegment = image.height / countSegmentsInColumn;
      double widthSegment = image.width / countSegmentsInRow;

      Map<int, List<Uint8List>> indexColumnAndSegmentsImage = {};

      Map<int, List<Map<int, List<int>>>>
          indexColumnAndSegmentsInRowInPixelsIntColor = {};

      int indexColumn = 0;
      for (double y = 0; y < image.height; y += heightSegment) {
        for (double x = 0; (x < image.width); x += widthSegment) {
          img.Image _segmentImage = img.copyCrop(
            image,
            x: x.toInt(),
            y: y.toInt(),
            width: widthSegment.toInt(),
            height: heightSegment.toInt(),
          );

          Uint8List segmentImageBytes = img.encodeJpg(_segmentImage);

          //индекс строки и пиксели в этой строке
          Map<int, List<int>> _pixelsImageInGrey = await _generatePixelsSegment(
            image: _segmentImage,
            sizePixel: _sizePixel,
          );

          if (indexColumnAndSegmentsImage[indexColumn] == null ||
              indexColumnAndSegmentsImage[indexColumn]!.isEmpty) {
            indexColumnAndSegmentsImage[indexColumn] = [segmentImageBytes];
          } else {
            indexColumnAndSegmentsImage[indexColumn] = [
              ...indexColumnAndSegmentsImage[indexColumn]!,
              segmentImageBytes,
            ];
          }

          if (indexColumnAndSegmentsInRowInPixelsIntColor[indexColumn] ==
                  null ||
              indexColumnAndSegmentsInRowInPixelsIntColor[indexColumn]!
                  .isEmpty) {
            indexColumnAndSegmentsInRowInPixelsIntColor[indexColumn] = [
              _pixelsImageInGrey,
            ];
          } else {
            indexColumnAndSegmentsInRowInPixelsIntColor[indexColumn] = [
              ...indexColumnAndSegmentsInRowInPixelsIntColor[indexColumn]!,
              _pixelsImageInGrey,
            ];
          }
        }
        indexColumn += 1;
      }

      emit(
        state.copyWith(
          isLoading: false,
          splitImageModel: state.splitImageModel.copyWith(
            mapRowIndexAndListColor: _pixelsImageInGrey,
            indexColumnAndSegmentsImage: indexColumnAndSegmentsImage,
            indexColumnAndSegmentsInRowInPixels:
                indexColumnAndSegmentsInRowInPixelsIntColor,
            sizePixel: _sizePixel,
            kSegmentsHeight: kSegmentsHeight,
            kSegmentsWidth: kSegmentsWidth,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  ////_______________________________________________________________________________________________
  //// Все пиксели картинки
  ////_______________________________________________________________________________________________

  Future<Map<int, List<int>>> _generatePixelsSegment({
    required img.Image image,
    required material.Size sizePixel,
  }) async {
    print(
        '[qbrix_bloc] _generatePixelsSegment image.height ${image.height} image.width ${image.width}'
        'sizePixel $sizePixel');
    Map<int, List<int>> _pixelsImageInGrey = {};
    int indexRow = 0;

    for (double y = 0; y < image.height; y += sizePixel.height) {
      List<int> colorPixelsAllImage = [];

      for (double x = 0; (x < image.width); x += sizePixel.width) {
        final img.Image imagePixel = img.copyCrop(
          image,
          x: x.toInt(),
          y: y.toInt(),
          width: sizePixel.width.toInt(),
          height: sizePixel.height.toInt(),
        );

        final int valueColor =
            (await getMainPuzzleColor(image: imagePixel)).value;
        colorPixelsAllImage.add(valueColor);
      }
      _pixelsImageInGrey[indexRow] = colorPixelsAllImage;
      indexRow += 1;
    }
    return _pixelsImageInGrey;
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

Future<material.Color> getMainPuzzleColor({required img.Image image}) async {
  PaletteGenerator _paletteGenerator = await PaletteGenerator.fromByteData(
    EncodedImage(
      image.buffer.asByteData(),
      // ByteData.view(image.getBytes().buffer),
      height: image.width,
      width: image.height,
    ),
    maximumColorCount: 4,
  );
  material.Color dominantColor = _paletteGenerator.dominantColor?.color ??
      _paletteGenerator.vibrantColor?.color ??
      _paletteGenerator.mutedColor?.color ??
      material.Colors.black;
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
