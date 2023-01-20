import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/data/repository_home.dart';
import 'package:alsallabi/features/viedos/data/video_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'home_page_video_state.dart';
part 'home_page_video_cubit.freezed.dart';

class HomePageVideoCubit extends Cubit<HomePageVideoState> {
  HomePageVideoCubit() : super(const HomePageVideoState.initial());
   getMostVideo() async {
    emit(const HomePageVideoState.loading());
    final repo = GetIt.instance<HomeRepository>();
    try {
      var respons = await repo.getListAricels('$baseUrl/api/salabiVideoMainAPI/');
      List<VideoModel> list = [];

      for (var x in respons) {
        list.add(VideoModel.fromJson(x));
      }

      emit(HomePageVideoState.loaded(list));
    } catch (e) {
      emit(HomePageVideoState.error(e.toString()));
    }
    
  Future<List<VideoModel>> getPreVideos(String pk) async {
    final repo = GetIt.instance<HomeRepository>();
    try {
      var respons = await repo.getPreVideos(pk);
      List<VideoModel> list = [];

      for (var x in respons) {
        list.add(VideoModel.fromJson(x));
      }
    } catch (e) {}
    return [];
  }
  }
}
