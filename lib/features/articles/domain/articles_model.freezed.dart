// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Aricels _$AricelsFromJson(Map<String, dynamic> json) {
  return _Aricels.fromJson(json);
}

/// @nodoc
mixin _$Aricels {
  int get pk => throw _privateConstructorUsedError;
  Map<String, Object> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AricelsCopyWith<Aricels> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AricelsCopyWith<$Res> {
  factory $AricelsCopyWith(Aricels value, $Res Function(Aricels) then) =
      _$AricelsCopyWithImpl<$Res, Aricels>;
  @useResult
  $Res call({int pk, Map<String, Object> fields});
}

/// @nodoc
class _$AricelsCopyWithImpl<$Res, $Val extends Aricels>
    implements $AricelsCopyWith<$Res> {
  _$AricelsCopyWithImpl(this._value, this._then);

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
abstract class _$$_AricelsCopyWith<$Res> implements $AricelsCopyWith<$Res> {
  factory _$$_AricelsCopyWith(
          _$_Aricels value, $Res Function(_$_Aricels) then) =
      __$$_AricelsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pk, Map<String, Object> fields});
}

/// @nodoc
class __$$_AricelsCopyWithImpl<$Res>
    extends _$AricelsCopyWithImpl<$Res, _$_Aricels>
    implements _$$_AricelsCopyWith<$Res> {
  __$$_AricelsCopyWithImpl(_$_Aricels _value, $Res Function(_$_Aricels) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? fields = null,
  }) {
    return _then(_$_Aricels(
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
class _$_Aricels with DiagnosticableTreeMixin implements _Aricels {
  const _$_Aricels(
      {required this.pk, final Map<String, Object> fields = const {}})
      : _fields = fields;

  factory _$_Aricels.fromJson(Map<String, dynamic> json) =>
      _$$_AricelsFromJson(json);

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
    return 'Aricels(pk: $pk, fields: $fields)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Aricels'))
      ..add(DiagnosticsProperty('pk', pk))
      ..add(DiagnosticsProperty('fields', fields));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Aricels &&
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
  _$$_AricelsCopyWith<_$_Aricels> get copyWith =>
      __$$_AricelsCopyWithImpl<_$_Aricels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AricelsToJson(
      this,
    );
  }
}

abstract class _Aricels implements Aricels {
  const factory _Aricels(
      {required final int pk, final Map<String, Object> fields}) = _$_Aricels;

  factory _Aricels.fromJson(Map<String, dynamic> json) = _$_Aricels.fromJson;

  @override
  int get pk;
  @override
  Map<String, Object> get fields;
  @override
  @JsonKey(ignore: true)
  _$$_AricelsCopyWith<_$_Aricels> get copyWith =>
      throw _privateConstructorUsedError;
}
