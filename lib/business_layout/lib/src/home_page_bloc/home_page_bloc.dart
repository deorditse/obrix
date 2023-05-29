import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:logger/logger.dart';
import 'package:models/models.dart';
import 'package:palette_generator/palette_generator.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

///for freezed
part 'home_page_bloc.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageEvent>(
      (HomePageEvent event, _) {
        event.when<void>(
          initial: _initial,
          splitImageInPixeles: _splitImageInPixeles,
        );
      },
    );
  }

  void _initial() {
    emit(const HomePageState());
  }

  Future<void> _splitImageInPixeles(
    Uint8List imageInBytes,
    int squareCountInRow,
    int squareCountInColumn,
  ) async {
    emit(const HomePageState(isLoading: true));

    Map<int, List<Color>> mapRowIndexAndListColor = {};

    img.Image? image;
    late int sizePixel;

    image = img.grayscale(img.decodeImage(imageInBytes)!);
    sizePixel = image.width ~/ squareCountInRow;

    Logger().log(
      Level.debug,
      '[home_page_bloc] image split go',
    );

    int indexRow = 0;
    for (var y = 0; y < image.height; y += sizePixel) {
      List<Color> rowListColor = [];
      for (var x = 0; (x < image.width); x += sizePixel) {
        final img.Image imagePixel = img.copyCrop(image,
            x: x, y: y, width: sizePixel, height: sizePixel);

        final Color valueColor = await getMainPuzzleColor(image: imagePixel);

        rowListColor.add(valueColor);
      }

      mapRowIndexAndListColor[indexRow] = rowListColor;
      indexRow += 1;
    }

    emit(HomePageState(
      isLoading: false,
      splitImageModel: SplitImageModel(
        mapRowIndexAndListColor: mapRowIndexAndListColor,
        squareCountInRow: squareCountInRow,
        squareCountInColumn: squareCountInColumn,
        sizePixel: sizePixel,
        sizeImage: Size(image.width.toDouble(), image.height.toDouble()),
      ),
    ));
  }
}

Future<Color> getMainPuzzleColor({required img.Image image}) async {
 ;
  Color _primaryColor = Colors.red;

 PaletteGenerator _paletteGenerator = await PaletteGenerator.fromByteData(
    EncodedImage(
      ByteData.view(image.getBytes().buffer),
      height: image.width,
      width: image.height,
    ),
    maximumColorCount: 10,
  );
  Color dominantColor = _paletteGenerator.dominantColor?.color ?? _paletteGenerator.vibrantColor?.color ?? _paletteGenerator.mutedColor?.color ?? Colors.black ;
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
  // switch (massColor) {
  //   case 0:
  //     return Colors.red;
  //   case 2:
  //     return Colors.white;
  //   case 3:
  //     return Colors.black;
  //   case 4:
  //     return Colors.green;
  //   default:
  //     return Colors.green;
  // }
}
