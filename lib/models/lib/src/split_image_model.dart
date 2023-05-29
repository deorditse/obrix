import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io'; //delete for add new model File

part 'split_image_model.freezed.dart';

// part 'split_image_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class SplitImageModel with _$SplitImageModel {
  const factory SplitImageModel({
    @Default({}) Map<int, List<Color>> mapRowIndexAndListColor,
    int? squareCountInRow,
    int? squareCountInColumn,
    int? sizePixel,
    @Default(Size(400, 400)) Size sizeImage,
  }) = _SplitImageModel;
}
