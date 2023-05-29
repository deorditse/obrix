part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.initial() = _InitialHomePageEvent;

  const factory HomePageEvent.splitImageInPixeles({
    required Uint8List imageInBytes,
   @Default(10) int  squareCountInRow,
    @Default(10) int  squareCountInColumn,
  }) = SplitImageInPixelesHomePageEvent;
}
