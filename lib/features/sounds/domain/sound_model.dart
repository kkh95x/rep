

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sound_model.freezed.dart';
part 'sound_model.g.dart';

@freezed
class SoundModel with _$SoundModel {
  const factory SoundModel({
    required int pk,
    @Default({})Map<String,Object> fields,
  
    

    

    
  }) = _SoundModel;

  factory SoundModel.fromJson(Map<String, Object?> json)
      => _$SoundModelFromJson(json);
}
