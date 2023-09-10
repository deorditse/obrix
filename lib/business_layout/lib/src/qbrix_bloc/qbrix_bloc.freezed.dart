// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qbrix_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QbrixEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<Uint8List> readAsBytes)
        splitImageInPixelsNew,
    required TResult Function() clearAll,
    required TResult Function(String imagePath) pickNewImagePath,
    required TResult Function(FormatImage? formatImage) selectCropFormat,
    required TResult Function(CroppedFile croppedFile) addCroppedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult? Function()? clearAll,
    TResult? Function(String imagePath)? pickNewImagePath,
    TResult? Function(FormatImage? formatImage)? selectCropFormat,
    TResult? Function(CroppedFile croppedFile)? addCroppedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult Function()? clearAll,
    TResult Function(String imagePath)? pickNewImagePath,
    TResult Function(FormatImage? formatImage)? selectCropFormat,
    TResult Function(CroppedFile croppedFile)? addCroppedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplitImageInPixelesNewQbrixEventc value)
        splitImageInPixelsNew,
    required TResult Function(_ClearAllQbrixEvent value) clearAll,
    required TResult Function(_PickNewImagePathQbrixEvent value)
        pickNewImagePath,
    required TResult Function(_SelectCropFormatQbrixEvent value)
        selectCropFormat,
    required TResult Function(_AddCroppedImageQbrixEvent value) addCroppedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult? Function(_ClearAllQbrixEvent value)? clearAll,
    TResult? Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult? Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult? Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult Function(_ClearAllQbrixEvent value)? clearAll,
    TResult Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QbrixEventCopyWith<$Res> {
  factory $QbrixEventCopyWith(
          QbrixEvent value, $Res Function(QbrixEvent) then) =
      _$QbrixEventCopyWithImpl<$Res, QbrixEvent>;
}

/// @nodoc
class _$QbrixEventCopyWithImpl<$Res, $Val extends QbrixEvent>
    implements $QbrixEventCopyWith<$Res> {
  _$QbrixEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SplitImageInPixelesNewQbrixEventcCopyWith<$Res> {
  factory _$$_SplitImageInPixelesNewQbrixEventcCopyWith(
          _$_SplitImageInPixelesNewQbrixEventc value,
          $Res Function(_$_SplitImageInPixelesNewQbrixEventc) then) =
      __$$_SplitImageInPixelesNewQbrixEventcCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<Uint8List> readAsBytes});
}

/// @nodoc
class __$$_SplitImageInPixelesNewQbrixEventcCopyWithImpl<$Res>
    extends _$QbrixEventCopyWithImpl<$Res, _$_SplitImageInPixelesNewQbrixEventc>
    implements _$$_SplitImageInPixelesNewQbrixEventcCopyWith<$Res> {
  __$$_SplitImageInPixelesNewQbrixEventcCopyWithImpl(
      _$_SplitImageInPixelesNewQbrixEventc _value,
      $Res Function(_$_SplitImageInPixelesNewQbrixEventc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? readAsBytes = null,
  }) {
    return _then(_$_SplitImageInPixelesNewQbrixEventc(
      readAsBytes: null == readAsBytes
          ? _value.readAsBytes
          : readAsBytes // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List>,
    ));
  }
}

/// @nodoc

class _$_SplitImageInPixelesNewQbrixEventc
    with DiagnosticableTreeMixin
    implements _SplitImageInPixelesNewQbrixEventc {
  const _$_SplitImageInPixelesNewQbrixEventc({required this.readAsBytes});

  @override
  final Future<Uint8List> readAsBytes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QbrixEvent.splitImageInPixelsNew(readAsBytes: $readAsBytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QbrixEvent.splitImageInPixelsNew'))
      ..add(DiagnosticsProperty('readAsBytes', readAsBytes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SplitImageInPixelesNewQbrixEventc &&
            (identical(other.readAsBytes, readAsBytes) ||
                other.readAsBytes == readAsBytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, readAsBytes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SplitImageInPixelesNewQbrixEventcCopyWith<
          _$_SplitImageInPixelesNewQbrixEventc>
      get copyWith => __$$_SplitImageInPixelesNewQbrixEventcCopyWithImpl<
          _$_SplitImageInPixelesNewQbrixEventc>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<Uint8List> readAsBytes)
        splitImageInPixelsNew,
    required TResult Function() clearAll,
    required TResult Function(String imagePath) pickNewImagePath,
    required TResult Function(FormatImage? formatImage) selectCropFormat,
    required TResult Function(CroppedFile croppedFile) addCroppedImage,
  }) {
    return splitImageInPixelsNew(readAsBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult? Function()? clearAll,
    TResult? Function(String imagePath)? pickNewImagePath,
    TResult? Function(FormatImage? formatImage)? selectCropFormat,
    TResult? Function(CroppedFile croppedFile)? addCroppedImage,
  }) {
    return splitImageInPixelsNew?.call(readAsBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult Function()? clearAll,
    TResult Function(String imagePath)? pickNewImagePath,
    TResult Function(FormatImage? formatImage)? selectCropFormat,
    TResult Function(CroppedFile croppedFile)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (splitImageInPixelsNew != null) {
      return splitImageInPixelsNew(readAsBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplitImageInPixelesNewQbrixEventc value)
        splitImageInPixelsNew,
    required TResult Function(_ClearAllQbrixEvent value) clearAll,
    required TResult Function(_PickNewImagePathQbrixEvent value)
        pickNewImagePath,
    required TResult Function(_SelectCropFormatQbrixEvent value)
        selectCropFormat,
    required TResult Function(_AddCroppedImageQbrixEvent value) addCroppedImage,
  }) {
    return splitImageInPixelsNew(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult? Function(_ClearAllQbrixEvent value)? clearAll,
    TResult? Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult? Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult? Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
  }) {
    return splitImageInPixelsNew?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult Function(_ClearAllQbrixEvent value)? clearAll,
    TResult Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (splitImageInPixelsNew != null) {
      return splitImageInPixelsNew(this);
    }
    return orElse();
  }
}

abstract class _SplitImageInPixelesNewQbrixEventc implements QbrixEvent {
  const factory _SplitImageInPixelesNewQbrixEventc(
          {required final Future<Uint8List> readAsBytes}) =
      _$_SplitImageInPixelesNewQbrixEventc;

  Future<Uint8List> get readAsBytes;
  @JsonKey(ignore: true)
  _$$_SplitImageInPixelesNewQbrixEventcCopyWith<
          _$_SplitImageInPixelesNewQbrixEventc>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearAllQbrixEventCopyWith<$Res> {
  factory _$$_ClearAllQbrixEventCopyWith(_$_ClearAllQbrixEvent value,
          $Res Function(_$_ClearAllQbrixEvent) then) =
      __$$_ClearAllQbrixEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearAllQbrixEventCopyWithImpl<$Res>
    extends _$QbrixEventCopyWithImpl<$Res, _$_ClearAllQbrixEvent>
    implements _$$_ClearAllQbrixEventCopyWith<$Res> {
  __$$_ClearAllQbrixEventCopyWithImpl(
      _$_ClearAllQbrixEvent _value, $Res Function(_$_ClearAllQbrixEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearAllQbrixEvent
    with DiagnosticableTreeMixin
    implements _ClearAllQbrixEvent {
  const _$_ClearAllQbrixEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QbrixEvent.clearAll()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QbrixEvent.clearAll'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearAllQbrixEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<Uint8List> readAsBytes)
        splitImageInPixelsNew,
    required TResult Function() clearAll,
    required TResult Function(String imagePath) pickNewImagePath,
    required TResult Function(FormatImage? formatImage) selectCropFormat,
    required TResult Function(CroppedFile croppedFile) addCroppedImage,
  }) {
    return clearAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult? Function()? clearAll,
    TResult? Function(String imagePath)? pickNewImagePath,
    TResult? Function(FormatImage? formatImage)? selectCropFormat,
    TResult? Function(CroppedFile croppedFile)? addCroppedImage,
  }) {
    return clearAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult Function()? clearAll,
    TResult Function(String imagePath)? pickNewImagePath,
    TResult Function(FormatImage? formatImage)? selectCropFormat,
    TResult Function(CroppedFile croppedFile)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (clearAll != null) {
      return clearAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplitImageInPixelesNewQbrixEventc value)
        splitImageInPixelsNew,
    required TResult Function(_ClearAllQbrixEvent value) clearAll,
    required TResult Function(_PickNewImagePathQbrixEvent value)
        pickNewImagePath,
    required TResult Function(_SelectCropFormatQbrixEvent value)
        selectCropFormat,
    required TResult Function(_AddCroppedImageQbrixEvent value) addCroppedImage,
  }) {
    return clearAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult? Function(_ClearAllQbrixEvent value)? clearAll,
    TResult? Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult? Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult? Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
  }) {
    return clearAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult Function(_ClearAllQbrixEvent value)? clearAll,
    TResult Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (clearAll != null) {
      return clearAll(this);
    }
    return orElse();
  }
}

abstract class _ClearAllQbrixEvent implements QbrixEvent {
  const factory _ClearAllQbrixEvent() = _$_ClearAllQbrixEvent;
}

/// @nodoc
abstract class _$$_PickNewImagePathQbrixEventCopyWith<$Res> {
  factory _$$_PickNewImagePathQbrixEventCopyWith(
          _$_PickNewImagePathQbrixEvent value,
          $Res Function(_$_PickNewImagePathQbrixEvent) then) =
      __$$_PickNewImagePathQbrixEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$_PickNewImagePathQbrixEventCopyWithImpl<$Res>
    extends _$QbrixEventCopyWithImpl<$Res, _$_PickNewImagePathQbrixEvent>
    implements _$$_PickNewImagePathQbrixEventCopyWith<$Res> {
  __$$_PickNewImagePathQbrixEventCopyWithImpl(
      _$_PickNewImagePathQbrixEvent _value,
      $Res Function(_$_PickNewImagePathQbrixEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$_PickNewImagePathQbrixEvent(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PickNewImagePathQbrixEvent
    with DiagnosticableTreeMixin
    implements _PickNewImagePathQbrixEvent {
  const _$_PickNewImagePathQbrixEvent({required this.imagePath});

  @override
  final String imagePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QbrixEvent.pickNewImagePath(imagePath: $imagePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QbrixEvent.pickNewImagePath'))
      ..add(DiagnosticsProperty('imagePath', imagePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PickNewImagePathQbrixEvent &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PickNewImagePathQbrixEventCopyWith<_$_PickNewImagePathQbrixEvent>
      get copyWith => __$$_PickNewImagePathQbrixEventCopyWithImpl<
          _$_PickNewImagePathQbrixEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<Uint8List> readAsBytes)
        splitImageInPixelsNew,
    required TResult Function() clearAll,
    required TResult Function(String imagePath) pickNewImagePath,
    required TResult Function(FormatImage? formatImage) selectCropFormat,
    required TResult Function(CroppedFile croppedFile) addCroppedImage,
  }) {
    return pickNewImagePath(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult? Function()? clearAll,
    TResult? Function(String imagePath)? pickNewImagePath,
    TResult? Function(FormatImage? formatImage)? selectCropFormat,
    TResult? Function(CroppedFile croppedFile)? addCroppedImage,
  }) {
    return pickNewImagePath?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult Function()? clearAll,
    TResult Function(String imagePath)? pickNewImagePath,
    TResult Function(FormatImage? formatImage)? selectCropFormat,
    TResult Function(CroppedFile croppedFile)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (pickNewImagePath != null) {
      return pickNewImagePath(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplitImageInPixelesNewQbrixEventc value)
        splitImageInPixelsNew,
    required TResult Function(_ClearAllQbrixEvent value) clearAll,
    required TResult Function(_PickNewImagePathQbrixEvent value)
        pickNewImagePath,
    required TResult Function(_SelectCropFormatQbrixEvent value)
        selectCropFormat,
    required TResult Function(_AddCroppedImageQbrixEvent value) addCroppedImage,
  }) {
    return pickNewImagePath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult? Function(_ClearAllQbrixEvent value)? clearAll,
    TResult? Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult? Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult? Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
  }) {
    return pickNewImagePath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult Function(_ClearAllQbrixEvent value)? clearAll,
    TResult Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (pickNewImagePath != null) {
      return pickNewImagePath(this);
    }
    return orElse();
  }
}

abstract class _PickNewImagePathQbrixEvent implements QbrixEvent {
  const factory _PickNewImagePathQbrixEvent({required final String imagePath}) =
      _$_PickNewImagePathQbrixEvent;

  String get imagePath;
  @JsonKey(ignore: true)
  _$$_PickNewImagePathQbrixEventCopyWith<_$_PickNewImagePathQbrixEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectCropFormatQbrixEventCopyWith<$Res> {
  factory _$$_SelectCropFormatQbrixEventCopyWith(
          _$_SelectCropFormatQbrixEvent value,
          $Res Function(_$_SelectCropFormatQbrixEvent) then) =
      __$$_SelectCropFormatQbrixEventCopyWithImpl<$Res>;
  @useResult
  $Res call({FormatImage? formatImage});
}

/// @nodoc
class __$$_SelectCropFormatQbrixEventCopyWithImpl<$Res>
    extends _$QbrixEventCopyWithImpl<$Res, _$_SelectCropFormatQbrixEvent>
    implements _$$_SelectCropFormatQbrixEventCopyWith<$Res> {
  __$$_SelectCropFormatQbrixEventCopyWithImpl(
      _$_SelectCropFormatQbrixEvent _value,
      $Res Function(_$_SelectCropFormatQbrixEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formatImage = freezed,
  }) {
    return _then(_$_SelectCropFormatQbrixEvent(
      formatImage: freezed == formatImage
          ? _value.formatImage
          : formatImage // ignore: cast_nullable_to_non_nullable
              as FormatImage?,
    ));
  }
}

/// @nodoc

class _$_SelectCropFormatQbrixEvent
    with DiagnosticableTreeMixin
    implements _SelectCropFormatQbrixEvent {
  const _$_SelectCropFormatQbrixEvent({required this.formatImage});

  @override
  final FormatImage? formatImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QbrixEvent.selectCropFormat(formatImage: $formatImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QbrixEvent.selectCropFormat'))
      ..add(DiagnosticsProperty('formatImage', formatImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectCropFormatQbrixEvent &&
            (identical(other.formatImage, formatImage) ||
                other.formatImage == formatImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formatImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectCropFormatQbrixEventCopyWith<_$_SelectCropFormatQbrixEvent>
      get copyWith => __$$_SelectCropFormatQbrixEventCopyWithImpl<
          _$_SelectCropFormatQbrixEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<Uint8List> readAsBytes)
        splitImageInPixelsNew,
    required TResult Function() clearAll,
    required TResult Function(String imagePath) pickNewImagePath,
    required TResult Function(FormatImage? formatImage) selectCropFormat,
    required TResult Function(CroppedFile croppedFile) addCroppedImage,
  }) {
    return selectCropFormat(formatImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult? Function()? clearAll,
    TResult? Function(String imagePath)? pickNewImagePath,
    TResult? Function(FormatImage? formatImage)? selectCropFormat,
    TResult? Function(CroppedFile croppedFile)? addCroppedImage,
  }) {
    return selectCropFormat?.call(formatImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult Function()? clearAll,
    TResult Function(String imagePath)? pickNewImagePath,
    TResult Function(FormatImage? formatImage)? selectCropFormat,
    TResult Function(CroppedFile croppedFile)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (selectCropFormat != null) {
      return selectCropFormat(formatImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplitImageInPixelesNewQbrixEventc value)
        splitImageInPixelsNew,
    required TResult Function(_ClearAllQbrixEvent value) clearAll,
    required TResult Function(_PickNewImagePathQbrixEvent value)
        pickNewImagePath,
    required TResult Function(_SelectCropFormatQbrixEvent value)
        selectCropFormat,
    required TResult Function(_AddCroppedImageQbrixEvent value) addCroppedImage,
  }) {
    return selectCropFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult? Function(_ClearAllQbrixEvent value)? clearAll,
    TResult? Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult? Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult? Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
  }) {
    return selectCropFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult Function(_ClearAllQbrixEvent value)? clearAll,
    TResult Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (selectCropFormat != null) {
      return selectCropFormat(this);
    }
    return orElse();
  }
}

abstract class _SelectCropFormatQbrixEvent implements QbrixEvent {
  const factory _SelectCropFormatQbrixEvent(
          {required final FormatImage? formatImage}) =
      _$_SelectCropFormatQbrixEvent;

  FormatImage? get formatImage;
  @JsonKey(ignore: true)
  _$$_SelectCropFormatQbrixEventCopyWith<_$_SelectCropFormatQbrixEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddCroppedImageQbrixEventCopyWith<$Res> {
  factory _$$_AddCroppedImageQbrixEventCopyWith(
          _$_AddCroppedImageQbrixEvent value,
          $Res Function(_$_AddCroppedImageQbrixEvent) then) =
      __$$_AddCroppedImageQbrixEventCopyWithImpl<$Res>;
  @useResult
  $Res call({CroppedFile croppedFile});
}

/// @nodoc
class __$$_AddCroppedImageQbrixEventCopyWithImpl<$Res>
    extends _$QbrixEventCopyWithImpl<$Res, _$_AddCroppedImageQbrixEvent>
    implements _$$_AddCroppedImageQbrixEventCopyWith<$Res> {
  __$$_AddCroppedImageQbrixEventCopyWithImpl(
      _$_AddCroppedImageQbrixEvent _value,
      $Res Function(_$_AddCroppedImageQbrixEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? croppedFile = null,
  }) {
    return _then(_$_AddCroppedImageQbrixEvent(
      croppedFile: null == croppedFile
          ? _value.croppedFile
          : croppedFile // ignore: cast_nullable_to_non_nullable
              as CroppedFile,
    ));
  }
}

/// @nodoc

class _$_AddCroppedImageQbrixEvent
    with DiagnosticableTreeMixin
    implements _AddCroppedImageQbrixEvent {
  const _$_AddCroppedImageQbrixEvent({required this.croppedFile});

  @override
  final CroppedFile croppedFile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QbrixEvent.addCroppedImage(croppedFile: $croppedFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QbrixEvent.addCroppedImage'))
      ..add(DiagnosticsProperty('croppedFile', croppedFile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCroppedImageQbrixEvent &&
            (identical(other.croppedFile, croppedFile) ||
                other.croppedFile == croppedFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, croppedFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCroppedImageQbrixEventCopyWith<_$_AddCroppedImageQbrixEvent>
      get copyWith => __$$_AddCroppedImageQbrixEventCopyWithImpl<
          _$_AddCroppedImageQbrixEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<Uint8List> readAsBytes)
        splitImageInPixelsNew,
    required TResult Function() clearAll,
    required TResult Function(String imagePath) pickNewImagePath,
    required TResult Function(FormatImage? formatImage) selectCropFormat,
    required TResult Function(CroppedFile croppedFile) addCroppedImage,
  }) {
    return addCroppedImage(croppedFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult? Function()? clearAll,
    TResult? Function(String imagePath)? pickNewImagePath,
    TResult? Function(FormatImage? formatImage)? selectCropFormat,
    TResult? Function(CroppedFile croppedFile)? addCroppedImage,
  }) {
    return addCroppedImage?.call(croppedFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<Uint8List> readAsBytes)? splitImageInPixelsNew,
    TResult Function()? clearAll,
    TResult Function(String imagePath)? pickNewImagePath,
    TResult Function(FormatImage? formatImage)? selectCropFormat,
    TResult Function(CroppedFile croppedFile)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (addCroppedImage != null) {
      return addCroppedImage(croppedFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplitImageInPixelesNewQbrixEventc value)
        splitImageInPixelsNew,
    required TResult Function(_ClearAllQbrixEvent value) clearAll,
    required TResult Function(_PickNewImagePathQbrixEvent value)
        pickNewImagePath,
    required TResult Function(_SelectCropFormatQbrixEvent value)
        selectCropFormat,
    required TResult Function(_AddCroppedImageQbrixEvent value) addCroppedImage,
  }) {
    return addCroppedImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult? Function(_ClearAllQbrixEvent value)? clearAll,
    TResult? Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult? Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult? Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
  }) {
    return addCroppedImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplitImageInPixelesNewQbrixEventc value)?
        splitImageInPixelsNew,
    TResult Function(_ClearAllQbrixEvent value)? clearAll,
    TResult Function(_PickNewImagePathQbrixEvent value)? pickNewImagePath,
    TResult Function(_SelectCropFormatQbrixEvent value)? selectCropFormat,
    TResult Function(_AddCroppedImageQbrixEvent value)? addCroppedImage,
    required TResult orElse(),
  }) {
    if (addCroppedImage != null) {
      return addCroppedImage(this);
    }
    return orElse();
  }
}

abstract class _AddCroppedImageQbrixEvent implements QbrixEvent {
  const factory _AddCroppedImageQbrixEvent(
      {required final CroppedFile croppedFile}) = _$_AddCroppedImageQbrixEvent;

  CroppedFile get croppedFile;
  @JsonKey(ignore: true)
  _$$_AddCroppedImageQbrixEventCopyWith<_$_AddCroppedImageQbrixEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QbrixState {
  bool get isLoading => throw _privateConstructorUsedError;
  SplitImageModel get splitImageModel => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  CroppedFile? get croppedFile => throw _privateConstructorUsedError;
  Map<int, List<Uint8List>> get indexColumnAndSegmentsImage =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QbrixStateCopyWith<QbrixState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QbrixStateCopyWith<$Res> {
  factory $QbrixStateCopyWith(
          QbrixState value, $Res Function(QbrixState) then) =
      _$QbrixStateCopyWithImpl<$Res, QbrixState>;
  @useResult
  $Res call(
      {bool isLoading,
      SplitImageModel splitImageModel,
      String? imagePath,
      CroppedFile? croppedFile,
      Map<int, List<Uint8List>> indexColumnAndSegmentsImage});

  $SplitImageModelCopyWith<$Res> get splitImageModel;
}

/// @nodoc
class _$QbrixStateCopyWithImpl<$Res, $Val extends QbrixState>
    implements $QbrixStateCopyWith<$Res> {
  _$QbrixStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? splitImageModel = null,
    Object? imagePath = freezed,
    Object? croppedFile = freezed,
    Object? indexColumnAndSegmentsImage = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      splitImageModel: null == splitImageModel
          ? _value.splitImageModel
          : splitImageModel // ignore: cast_nullable_to_non_nullable
              as SplitImageModel,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      croppedFile: freezed == croppedFile
          ? _value.croppedFile
          : croppedFile // ignore: cast_nullable_to_non_nullable
              as CroppedFile?,
      indexColumnAndSegmentsImage: null == indexColumnAndSegmentsImage
          ? _value.indexColumnAndSegmentsImage
          : indexColumnAndSegmentsImage // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Uint8List>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SplitImageModelCopyWith<$Res> get splitImageModel {
    return $SplitImageModelCopyWith<$Res>(_value.splitImageModel, (value) {
      return _then(_value.copyWith(splitImageModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QbrixStateCopyWith<$Res>
    implements $QbrixStateCopyWith<$Res> {
  factory _$$_QbrixStateCopyWith(
          _$_QbrixState value, $Res Function(_$_QbrixState) then) =
      __$$_QbrixStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      SplitImageModel splitImageModel,
      String? imagePath,
      CroppedFile? croppedFile,
      Map<int, List<Uint8List>> indexColumnAndSegmentsImage});

  @override
  $SplitImageModelCopyWith<$Res> get splitImageModel;
}

/// @nodoc
class __$$_QbrixStateCopyWithImpl<$Res>
    extends _$QbrixStateCopyWithImpl<$Res, _$_QbrixState>
    implements _$$_QbrixStateCopyWith<$Res> {
  __$$_QbrixStateCopyWithImpl(
      _$_QbrixState _value, $Res Function(_$_QbrixState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? splitImageModel = null,
    Object? imagePath = freezed,
    Object? croppedFile = freezed,
    Object? indexColumnAndSegmentsImage = null,
  }) {
    return _then(_$_QbrixState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      splitImageModel: null == splitImageModel
          ? _value.splitImageModel
          : splitImageModel // ignore: cast_nullable_to_non_nullable
              as SplitImageModel,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      croppedFile: freezed == croppedFile
          ? _value.croppedFile
          : croppedFile // ignore: cast_nullable_to_non_nullable
              as CroppedFile?,
      indexColumnAndSegmentsImage: null == indexColumnAndSegmentsImage
          ? _value._indexColumnAndSegmentsImage
          : indexColumnAndSegmentsImage // ignore: cast_nullable_to_non_nullable
              as Map<int, List<Uint8List>>,
    ));
  }
}

/// @nodoc

class _$_QbrixState with DiagnosticableTreeMixin implements _QbrixState {
  const _$_QbrixState(
      {this.isLoading = true,
      this.splitImageModel = const SplitImageModel(),
      this.imagePath,
      this.croppedFile,
      final Map<int, List<Uint8List>> indexColumnAndSegmentsImage = const {}})
      : _indexColumnAndSegmentsImage = indexColumnAndSegmentsImage;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final SplitImageModel splitImageModel;
  @override
  final String? imagePath;
  @override
  final CroppedFile? croppedFile;
  final Map<int, List<Uint8List>> _indexColumnAndSegmentsImage;
  @override
  @JsonKey()
  Map<int, List<Uint8List>> get indexColumnAndSegmentsImage {
    if (_indexColumnAndSegmentsImage is EqualUnmodifiableMapView)
      return _indexColumnAndSegmentsImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_indexColumnAndSegmentsImage);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QbrixState(isLoading: $isLoading, splitImageModel: $splitImageModel, imagePath: $imagePath, croppedFile: $croppedFile, indexColumnAndSegmentsImage: $indexColumnAndSegmentsImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QbrixState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('splitImageModel', splitImageModel))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('croppedFile', croppedFile))
      ..add(DiagnosticsProperty(
          'indexColumnAndSegmentsImage', indexColumnAndSegmentsImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QbrixState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.splitImageModel, splitImageModel) ||
                other.splitImageModel == splitImageModel) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.croppedFile, croppedFile) ||
                other.croppedFile == croppedFile) &&
            const DeepCollectionEquality().equals(
                other._indexColumnAndSegmentsImage,
                _indexColumnAndSegmentsImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      splitImageModel,
      imagePath,
      croppedFile,
      const DeepCollectionEquality().hash(_indexColumnAndSegmentsImage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QbrixStateCopyWith<_$_QbrixState> get copyWith =>
      __$$_QbrixStateCopyWithImpl<_$_QbrixState>(this, _$identity);
}

abstract class _QbrixState implements QbrixState {
  const factory _QbrixState(
          {final bool isLoading,
          final SplitImageModel splitImageModel,
          final String? imagePath,
          final CroppedFile? croppedFile,
          final Map<int, List<Uint8List>> indexColumnAndSegmentsImage}) =
      _$_QbrixState;

  @override
  bool get isLoading;
  @override
  SplitImageModel get splitImageModel;
  @override
  String? get imagePath;
  @override
  CroppedFile? get croppedFile;
  @override
  Map<int, List<Uint8List>> get indexColumnAndSegmentsImage;
  @override
  @JsonKey(ignore: true)
  _$$_QbrixStateCopyWith<_$_QbrixState> get copyWith =>
      throw _privateConstructorUsedError;
}
