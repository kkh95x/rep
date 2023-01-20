// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SoundModel _$$_SoundModelFromJson(Map<String, dynamic> json) =>
    _$_SoundModel(
      pk: json['pk'] as int,
      fields: (json['fields'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Object),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_SoundModelToJson(_$_SoundModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'fields': instance.fields,
    };
