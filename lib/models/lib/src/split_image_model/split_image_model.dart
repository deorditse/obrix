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
    @Default({}) Map<int, List<Color>> mapRowIndexAndListColor,
    @Default({})
    Map<int, Map<int, List<Color>>>
        indexSegmentToIndexRowSegmentAndListPixelsColorHex,
    FormatImage? formatImage,
    Size? sizePixel,
    @Default(Size(400, 400)) Size sizeImage,
  }) = _SplitImageModelRes;
}
