// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return _VideoModel.fromJson(json);
}

/// @nodoc
mixin _$VideoModel {
  int get pk => throw _privateConstructorUsedError;
  Map<String, Object> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoModelCopyWith<VideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoModelCopyWith<$Res> {
  factory $VideoModelCopyWith(
          VideoModel value, $Res Function(VideoModel) then) =
      _$VideoModelCopyWithImpl<$Res, VideoModel>;
  @useResult
  $Res call({int pk, Map<String, Object> fields});
}

/// @nodoc
class _$VideoModelCopyWithImpl<$Res, $Val extends VideoModel>
    implements $VideoModelCopyWith<$Res> {
  _$VideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoModelCopyWith<$Res>
    implements $VideoModelCopyWith<$Res> {
  factory _$$_VideoModelCopyWith(
          _$_VideoModel value, $Res Function(_$_VideoModel) then) =
      __$$_VideoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pk, Map<String, Object> fields});
}

/// @nodoc
class __$$_VideoModelCopyWithImpl<$Res>
    extends _$VideoModelCopyWithImpl<$Res, _$_VideoModel>
    implements _$$_VideoModelCopyWith<$Res> {
  __$$_VideoModelCopyWithImpl(
      _$_VideoModel _value, $Res Function(_$_VideoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? fields = null,
  }) {
    return _then(_$_VideoModel(
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoModel with DiagnosticableTreeMixin implements _VideoModel {
  const _$_VideoModel(
      {required this.pk, final Map<String, Object> fields = const {}})
      : _fields = fields;

  factory _$_VideoModel.fromJson(Map<String, dynamic> json) =>
      _$$_VideoModelFromJson(json);

  @override
  final int pk;
  final Map<String, Object> _fields;
  @override
  @JsonKey()
  Map<String, Object> get fields {
    if (_fields is EqualUnmodifiableMapView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fields);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VideoModel(pk: $pk, fields: $fields)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VideoModel'))
      ..add(DiagnosticsProperty('pk', pk))
      ..add(DiagnosticsProperty('fields', fields));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoModel &&
            (identical(other.pk, pk) || other.pk == pk) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pk, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoModelCopyWith<_$_VideoModel> get copyWith =>
      __$$_VideoModelCopyWithImpl<_$_VideoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoModelToJson(
      this,
    );
  }
}

abstract class _VideoModel implements VideoModel {
  const factory _VideoModel(
      {required final int pk,
      final Map<String, Object> fields}) = _$_VideoModel;

  factory _VideoModel.fromJson(Map<String, dynamic> json) =
      _$_VideoModel.fromJson;

  @override
  int get pk;
  @override
  Map<String, Object> get fields;
  @override
  @JsonKey(ignore: true)
  _$$_VideoModelCopyWith<_$_VideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
