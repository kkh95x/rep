import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/data/repository_home.dart';
import 'package:alsallabi/features/sounds/domain/sound_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'home_page_sounds_state.dart';
part 'home_page_sounds_cubit.freezed.dart';

class HomePageSoundsCubit extends Cubit<HomePageSoundsState> {
  HomePageSoundsCubit() : super(HomePageSoundsState.initial());
  getMostVideo() async {
    emit(const HomePageSoundsState.loading());
    final repo = GetIt.instance<HomeRepository>();
    try {
      var respons = await repo.getListAricels('$baseUrl/api/salabiSoundPageAPI/53/');
      List<SoundModel> list = [];

      for (var x in respons) {
        list.add(SoundModel.fromJson(x));
      }

      emit(HomePageSoundsState.loaded(list));
    } catch (e) {
      emit(HomePageSoundsState.error(e.toString()));
    }
   
  }

}
