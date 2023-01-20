

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'articles_model.freezed.dart';
part 'articles_model.g.dart';

@freezed
class Aricels with _$Aricels {
  const factory Aricels({
    required int pk,
    @Default({})Map<String,Object> fields,
  
    

    

    
  }) = _Aricels;

  factory Aricels.fromJson(Map<String, Object?> json)
      => _$AricelsFromJson(json);
}
