part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(true) bool isLoading,
    @Default(SplitImageModel()) SplitImageModel splitImageModel,
  }) = _HomePageState;
}
