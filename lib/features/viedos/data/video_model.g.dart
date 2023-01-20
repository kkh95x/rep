// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoModel _$$_VideoModelFromJson(Map<String, dynamic> json) =>
    _$_VideoModel(
      pk: json['pk'] as int,
      fields: (json['fields'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Object),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_VideoModelToJson(_$_VideoModel instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'fields': instance.fields,
    };
