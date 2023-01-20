// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import 'package:alsallabi/features/app/data/repository_home.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

part 'hom_page_articale_cubit.freezed.dart';
part 'hom_page_artices_state.dart';

class HomPageCubit extends Cubit<HomPageArticelsState> {
  HomPageCubit() : super(const HomPageArticelsState.initial());
  getMostArticle() async {
    emit(const HomPageArticelsState.loading());
    final repo = GetIt.instance<HomeRepository>();
    try {
      var respons = await repo.getListAricels(
          '$baseUrl/api/salabiArticleMainAPI/');
      List<Aricels> list = [];

      for (var x in respons) {
        list.add(Aricels.fromJson(x));
      }

      emit(HomPageArticelsState.loaded(list));
    } catch (e) {
      emit(HomPageArticelsState.error(e.toString()));
    }
  }

  Future<List<Aricels>> getPreArticles(String pk) async {
    final repo = GetIt.instance<HomeRepository>();
    try {
      var respons = await repo.getPreArticals(pk);
      List<Aricels> list = [];

      for (var x in respons) {
        list.add(Aricels.fromJson(x));
      }
    } catch (e) {}
    return [];
  }

}
