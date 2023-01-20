part of 'hom_page_articale_cubit.dart';

@freezed
class HomPageArticelsState with _$HomPageArticelsState {
  const factory HomPageArticelsState.initial() = _Initial;
  const factory HomPageArticelsState.loading() = _loading;
  const factory HomPageArticelsState.loaded(List<Aricels> aricels) = _loaded;
  const factory HomPageArticelsState.error(String error) = _error;
}
