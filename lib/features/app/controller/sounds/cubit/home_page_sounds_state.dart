part of 'home_page_sounds_cubit.dart';

@freezed
class HomePageSoundsState with _$HomePageSoundsState {
const factory HomePageSoundsState.initial() = _Initial;
  const factory HomePageSoundsState.loading() = _loading;
  const factory HomePageSoundsState.loaded(List<SoundModel> sounds) = _loaded;
  const factory HomePageSoundsState.error(String error) = _error;
}
