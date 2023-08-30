part of 'qbrix_bloc.dart';

@freezed
class QbrixEvent with _$QbrixEvent {

  const factory QbrixEvent.splitImageInPixeles({
    required Future<Uint8List> readAsBytes,
  }) = _SplitImageInPixelesQbrixEventc;

  const factory QbrixEvent.clearAll() = _ClearAllQbrixEvent;

  const factory QbrixEvent.pickNewImagePath({
    required String imagePath,
  }) = _PickNewImagePathQbrixEvent;

  const factory QbrixEvent.selectCropFormat({
    required FormatImage? formatImage,
  }) = _SelectCropFormatQbrixEvent;

  const factory QbrixEvent.addCroppedImage({
    required CroppedFile croppedFile,
  }) = _AddCroppedImageQbrixEvent;
}
