import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io'; //delete for add new model File
import 'package:image/image.dart' as img;

part 'split_image_model.freezed.dart';

// part 'split_image_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

enum FormatImage {
  a4,
  a3,
}

@freezed
class SplitImageModel with _$SplitImageModel {
  const factory SplitImageModel({
    @Default({}) Map<int, List<int>> mapRowIndexAndListColor,
    @Default({}) Map<int, List<Uint8List>> indexColumnAndSegmentsImage,
    @Default({})
    Map<int, List<Map<int, List<int>>>> indexColumnAndSegmentsInRowInPixels,
    @Default(9) kSegmentsWidth,
    @Default(13) kSegmentsHeight,
    FormatImage? formatImage,
    Size? sizePixel,
  }) = _SplitImageModelRes;
}
