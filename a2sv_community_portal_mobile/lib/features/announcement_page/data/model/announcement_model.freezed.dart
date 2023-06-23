// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) {
  return _AnnouncementModel.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementModelCopyWith<AnnouncementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementModelCopyWith<$Res> {
  factory $AnnouncementModelCopyWith(
          AnnouncementModel value, $Res Function(AnnouncementModel) then) =
      _$AnnouncementModelCopyWithImpl<$Res, AnnouncementModel>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$AnnouncementModelCopyWithImpl<$Res, $Val extends AnnouncementModel>
    implements $AnnouncementModelCopyWith<$Res> {
  _$AnnouncementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementModelCopyWith<$Res>
    implements $AnnouncementModelCopyWith<$Res> {
  factory _$$_AnnouncementModelCopyWith(_$_AnnouncementModel value,
          $Res Function(_$_AnnouncementModel) then) =
      __$$_AnnouncementModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_AnnouncementModelCopyWithImpl<$Res>
    extends _$AnnouncementModelCopyWithImpl<$Res, _$_AnnouncementModel>
    implements _$$_AnnouncementModelCopyWith<$Res> {
  __$$_AnnouncementModelCopyWithImpl(
      _$_AnnouncementModel _value, $Res Function(_$_AnnouncementModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_AnnouncementModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnouncementModel
    with DiagnosticableTreeMixin
    implements _AnnouncementModel {
  const _$_AnnouncementModel({required this.title, required this.description});

  factory _$_AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementModelFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnnouncementModel(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnnouncementModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementModelCopyWith<_$_AnnouncementModel> get copyWith =>
      __$$_AnnouncementModelCopyWithImpl<_$_AnnouncementModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementModelToJson(
      this,
    );
  }
}

abstract class _AnnouncementModel implements AnnouncementModel {
  const factory _AnnouncementModel(
      {required final String title,
      required final String description}) = _$_AnnouncementModel;

  factory _AnnouncementModel.fromJson(Map<String, dynamic> json) =
      _$_AnnouncementModel.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementModelCopyWith<_$_AnnouncementModel> get copyWith =>
      throw _privateConstructorUsedError;
}
