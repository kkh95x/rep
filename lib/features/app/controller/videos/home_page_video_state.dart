part of 'home_page_video_cubit.dart';

@freezed
class HomePageVideoState with _$HomePageVideoState {
  const factory HomePageVideoState.initial() = _Initial;
  const factory HomePageVideoState.loading() = _loading;
  const factory HomePageVideoState.loaded(List<VideoModel> videoModel) = _loaded;
  const factory HomePageVideoState.error(String error) = _error;
}
