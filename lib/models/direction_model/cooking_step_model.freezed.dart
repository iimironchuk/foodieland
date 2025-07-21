// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CookingStepModel {

 StepBlockType get type; String get content;
/// Create a copy of CookingStepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookingStepModelCopyWith<CookingStepModel> get copyWith => _$CookingStepModelCopyWithImpl<CookingStepModel>(this as CookingStepModel, _$identity);

  /// Serializes this CookingStepModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookingStepModel&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,content);

@override
String toString() {
  return 'CookingStepModel(type: $type, content: $content)';
}


}

/// @nodoc
abstract mixin class $CookingStepModelCopyWith<$Res>  {
  factory $CookingStepModelCopyWith(CookingStepModel value, $Res Function(CookingStepModel) _then) = _$CookingStepModelCopyWithImpl;
@useResult
$Res call({
 StepBlockType type, String content
});




}
/// @nodoc
class _$CookingStepModelCopyWithImpl<$Res>
    implements $CookingStepModelCopyWith<$Res> {
  _$CookingStepModelCopyWithImpl(this._self, this._then);

  final CookingStepModel _self;
  final $Res Function(CookingStepModel) _then;

/// Create a copy of CookingStepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? content = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StepBlockType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CookingStepModel implements CookingStepModel {
   _CookingStepModel({required this.type, required this.content});
  factory _CookingStepModel.fromJson(Map<String, dynamic> json) => _$CookingStepModelFromJson(json);

@override final  StepBlockType type;
@override final  String content;

/// Create a copy of CookingStepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookingStepModelCopyWith<_CookingStepModel> get copyWith => __$CookingStepModelCopyWithImpl<_CookingStepModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CookingStepModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookingStepModel&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,content);

@override
String toString() {
  return 'CookingStepModel(type: $type, content: $content)';
}


}

/// @nodoc
abstract mixin class _$CookingStepModelCopyWith<$Res> implements $CookingStepModelCopyWith<$Res> {
  factory _$CookingStepModelCopyWith(_CookingStepModel value, $Res Function(_CookingStepModel) _then) = __$CookingStepModelCopyWithImpl;
@override @useResult
$Res call({
 StepBlockType type, String content
});




}
/// @nodoc
class __$CookingStepModelCopyWithImpl<$Res>
    implements _$CookingStepModelCopyWith<$Res> {
  __$CookingStepModelCopyWithImpl(this._self, this._then);

  final _CookingStepModel _self;
  final $Res Function(_CookingStepModel) _then;

/// Create a copy of CookingStepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? content = null,}) {
  return _then(_CookingStepModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StepBlockType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
