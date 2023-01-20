

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required int pk,
    @Default({})Map<String,Object> fields,
  
    

    

    
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, Object?> json)
      => _$VideoModelFromJson(json);
}
