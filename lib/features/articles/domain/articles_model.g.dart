// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Aricels _$$_AricelsFromJson(Map<String, dynamic> json) => _$_Aricels(
      pk: json['pk'] as int,
      fields: (json['fields'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Object),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_AricelsToJson(_$_Aricels instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'fields': instance.fields,
    };
