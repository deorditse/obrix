part of 'qbrix_bloc.dart';

@freezed
class QbrixState with _$QbrixState {
  const factory QbrixState({
    @Default(true) bool isLoading,
    @Default(SplitImageModel()) SplitImageModel splitImageModel,
    @Default({}) Map<int, List<Color>> mapRowIndexAndListColor,

    String? imagePath,
    CroppedFile? croppedFile,
  }) = _QbrixState;
}
