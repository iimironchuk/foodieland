// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostTextModel {

 PostTextType get type; String get content; int? get level;
/// Create a copy of PostTextModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostTextModelCopyWith<PostTextModel> get copyWith => _$PostTextModelCopyWithImpl<PostTextModel>(this as PostTextModel, _$identity);

  /// Serializes this PostTextModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostTextModel&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,content,level);

@override
String toString() {
  return 'PostTextModel(type: $type, content: $content, level: $level)';
}


}

/// @nodoc
abstract mixin class $PostTextModelCopyWith<$Res>  {
  factory $PostTextModelCopyWith(PostTextModel value, $Res Function(PostTextModel) _then) = _$PostTextModelCopyWithImpl;
@useResult
$Res call({
 PostTextType type, String content, int? level
});




}
/// @nodoc
class _$PostTextModelCopyWithImpl<$Res>
    implements $PostTextModelCopyWith<$Res> {
  _$PostTextModelCopyWithImpl(this._self, this._then);

  final PostTextModel _self;
  final $Res Function(PostTextModel) _then;

/// Create a copy of PostTextModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? content = null,Object? level = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostTextType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostTextModel implements PostTextModel {
   _PostTextModel({required this.type, required this.content, this.level});
  factory _PostTextModel.fromJson(Map<String, dynamic> json) => _$PostTextModelFromJson(json);

@override final  PostTextType type;
@override final  String content;
@override final  int? level;

/// Create a copy of PostTextModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostTextModelCopyWith<_PostTextModel> get copyWith => __$PostTextModelCopyWithImpl<_PostTextModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostTextModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostTextModel&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,content,level);

@override
String toString() {
  return 'PostTextModel(type: $type, content: $content, level: $level)';
}


}

/// @nodoc
abstract mixin class _$PostTextModelCopyWith<$Res> implements $PostTextModelCopyWith<$Res> {
  factory _$PostTextModelCopyWith(_PostTextModel value, $Res Function(_PostTextModel) _then) = __$PostTextModelCopyWithImpl;
@override @useResult
$Res call({
 PostTextType type, String content, int? level
});




}
/// @nodoc
class __$PostTextModelCopyWithImpl<$Res>
    implements _$PostTextModelCopyWith<$Res> {
  __$PostTextModelCopyWithImpl(this._self, this._then);

  final _PostTextModel _self;
  final $Res Function(_PostTextModel) _then;

/// Create a copy of PostTextModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? content = null,Object? level = freezed,}) {
  return _then(_PostTextModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PostTextType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
