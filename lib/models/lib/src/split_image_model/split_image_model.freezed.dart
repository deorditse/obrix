// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplitImageModel {
  Map<int, List<Color>> get mapRowIndexAndListColor =>
      throw _privateConstructorUsedError;
  FormatImage? get formatImage => throw _privateConstructorUsedError;
  int? get squareCountInRow => throw _privateConstructorUsedError;
  int? get squareCountInColumn => throw _privateConstructorUsedError;
  Size? get sizePixel => throw _privateConstructorUsedError;
  Size get sizeImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplitImageModelCopyWith<SplitImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitImageModelCopyWith<$Res> {
  factory $SplitImageModelCopyWith(
          SplitImageModel value, $Res Function(SplitImageModel) then) =
      _$SplitImageModelCopyWithImpl<$Res, SplitImageModel>;
  @useResult
  $Res call(
      {Map<int, List<Color>> mapRowIndexAndListColor,
      FormatImage? formatImage,
      int? squareCountInRow,
      int? squareCountInColumn,
      Size? sizePixel,
      Size sizeImage});
}

/// @nodoc
class _$SplitImageModelCopyWithImpl<$Res, $Val extends SplitImageModel>
    implements $SplitImageModelCopyWith<$Res> {
  _$SplitImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapRowIndexAndListColor = null,
    Object? formatImage = freezed,
    Object? squareCountInRow = freezed,
    Object? squareCountInColumn = freezed,
    Object? sizePixel = freezed,
    Object? sizeImage = null,
  }) {
    return _then(_value.copyWith(
      mapRowIndexAndListColor: null == mapRowIndexAndListColor
          ? _value.mapRowIndexAndListColor
          : mapRowIndexAndListColor // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Color>>,
      formatImage: freezed == formatImage
          ? _value.formatImage
          : formatImage // ignore: cast_nullable_to_non_nullable
              as FormatImage?,
      squareCountInRow: freezed == squareCountInRow
          ? _value.squareCountInRow
          : squareCountInRow // ignore: cast_nullable_to_non_nullable
              as int?,
      squareCountInColumn: freezed == squareCountInColumn
          ? _value.squareCountInColumn
          : squareCountInColumn // ignore: cast_nullable_to_non_nullable
              as int?,
      sizePixel: freezed == sizePixel
          ? _value.sizePixel
          : sizePixel // ignore: cast_nullable_to_non_nullable
              as Size?,
      sizeImage: null == sizeImage
          ? _value.sizeImage
          : sizeImage // ignore: cast_nullable_to_non_nullable
              as Size,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SplitImageModelResCopyWith<$Res>
    implements $SplitImageModelCopyWith<$Res> {
  factory _$$_SplitImageModelResCopyWith(_$_SplitImageModelRes value,
          $Res Function(_$_SplitImageModelRes) then) =
      __$$_SplitImageModelResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<int, List<Color>> mapRowIndexAndListColor,
      FormatImage? formatImage,
      int? squareCountInRow,
      int? squareCountInColumn,
      Size? sizePixel,
      Size sizeImage});
}

/// @nodoc
class __$$_SplitImageModelResCopyWithImpl<$Res>
    extends _$SplitImageModelCopyWithImpl<$Res, _$_SplitImageModelRes>
    implements _$$_SplitImageModelResCopyWith<$Res> {
  __$$_SplitImageModelResCopyWithImpl(
      _$_SplitImageModelRes _value, $Res Function(_$_SplitImageModelRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapRowIndexAndListColor = null,
    Object? formatImage = freezed,
    Object? squareCountInRow = freezed,
    Object? squareCountInColumn = freezed,
    Object? sizePixel = freezed,
    Object? sizeImage = null,
  }) {
    return _then(_$_SplitImageModelRes(
      mapRowIndexAndListColor: null == mapRowIndexAndListColor
          ? _value._mapRowIndexAndListColor
          : mapRowIndexAndListColor // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Color>>,
      formatImage: freezed == formatImage
          ? _value.formatImage
          : formatImage // ignore: cast_nullable_to_non_nullable
              as FormatImage?,
      squareCountInRow: freezed == squareCountInRow
          ? _value.squareCountInRow
          : squareCountInRow // ignore: cast_nullable_to_non_nullable
              as int?,
      squareCountInColumn: freezed == squareCountInColumn
          ? _value.squareCountInColumn
          : squareCountInColumn // ignore: cast_nullable_to_non_nullable
              as int?,
      sizePixel: freezed == sizePixel
          ? _value.sizePixel
          : sizePixel // ignore: cast_nullable_to_non_nullable
              as Size?,
      sizeImage: null == sizeImage
          ? _value.sizeImage
          : sizeImage // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$_SplitImageModelRes implements _SplitImageModelRes {
  const _$_SplitImageModelRes(
      {final Map<int, List<Color>> mapRowIndexAndListColor = const {},
      this.formatImage,
      this.squareCountInRow,
      this.squareCountInColumn,
      this.sizePixel,
      this.sizeImage = const Size(400, 400)})
      : _mapRowIndexAndListColor = mapRowIndexAndListColor;

  final Map<int, List<Color>> _mapRowIndexAndListColor;
  @override
  @JsonKey()
  Map<int, List<Color>> get mapRowIndexAndListColor {
    if (_mapRowIndexAndListColor is EqualUnmodifiableMapView)
      return _mapRowIndexAndListColor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mapRowIndexAndListColor);
  }

  @override
  final FormatImage? formatImage;
  @override
  final int? squareCountInRow;
  @override
  final int? squareCountInColumn;
  @override
  final Size? sizePixel;
  @override
  @JsonKey()
  final Size sizeImage;

  @override
  String toString() {
    return 'SplitImageModel(mapRowIndexAndListColor: $mapRowIndexAndListColor, formatImage: $formatImage, squareCountInRow: $squareCountInRow, squareCountInColumn: $squareCountInColumn, sizePixel: $sizePixel, sizeImage: $sizeImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SplitImageModelRes &&
            const DeepCollectionEquality().equals(
                other._mapRowIndexAndListColor, _mapRowIndexAndListColor) &&
            (identical(other.formatImage, formatImage) ||
                other.formatImage == formatImage) &&
            (identical(other.squareCountInRow, squareCountInRow) ||
                other.squareCountInRow == squareCountInRow) &&
            (identical(other.squareCountInColumn, squareCountInColumn) ||
                other.squareCountInColumn == squareCountInColumn) &&
            (identical(other.sizePixel, sizePixel) ||
                other.sizePixel == sizePixel) &&
            (identical(other.sizeImage, sizeImage) ||
                other.sizeImage == sizeImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mapRowIndexAndListColor),
      formatImage,
      squareCountInRow,
      squareCountInColumn,
      sizePixel,
      sizeImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SplitImageModelResCopyWith<_$_SplitImageModelRes> get copyWith =>
      __$$_SplitImageModelResCopyWithImpl<_$_SplitImageModelRes>(
          this, _$identity);
}

abstract class _SplitImageModelRes implements SplitImageModel {
  const factory _SplitImageModelRes(
      {final Map<int, List<Color>> mapRowIndexAndListColor,
      final FormatImage? formatImage,
      final int? squareCountInRow,
      final int? squareCountInColumn,
      final Size? sizePixel,
      final Size sizeImage}) = _$_SplitImageModelRes;

  @override
  Map<int, List<Color>> get mapRowIndexAndListColor;
  @override
  FormatImage? get formatImage;
  @override
  int? get squareCountInRow;
  @override
  int? get squareCountInColumn;
  @override
  Size? get sizePixel;
  @override
  Size get sizeImage;
  @override
  @JsonKey(ignore: true)
  _$$_SplitImageModelResCopyWith<_$_SplitImageModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}
