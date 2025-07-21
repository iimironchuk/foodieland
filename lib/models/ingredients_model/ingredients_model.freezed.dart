// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientsModel {

 String get type;@IngredientsBlockTextConverter() String get text;
/// Create a copy of IngredientsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientsModelCopyWith<IngredientsModel> get copyWith => _$IngredientsModelCopyWithImpl<IngredientsModel>(this as IngredientsModel, _$identity);

  /// Serializes this IngredientsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientsModel&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text);

@override
String toString() {
  return 'IngredientsModel(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class $IngredientsModelCopyWith<$Res>  {
  factory $IngredientsModelCopyWith(IngredientsModel value, $Res Function(IngredientsModel) _then) = _$IngredientsModelCopyWithImpl;
@useResult
$Res call({
 String type,@IngredientsBlockTextConverter() String text
});




}
/// @nodoc
class _$IngredientsModelCopyWithImpl<$Res>
    implements $IngredientsModelCopyWith<$Res> {
  _$IngredientsModelCopyWithImpl(this._self, this._then);

  final IngredientsModel _self;
  final $Res Function(IngredientsModel) _then;

/// Create a copy of IngredientsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IngredientsModel implements IngredientsModel {
   _IngredientsModel({required this.type, @IngredientsBlockTextConverter() required this.text});
  factory _IngredientsModel.fromJson(Map<String, dynamic> json) => _$IngredientsModelFromJson(json);

@override final  String type;
@override@IngredientsBlockTextConverter() final  String text;

/// Create a copy of IngredientsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientsModelCopyWith<_IngredientsModel> get copyWith => __$IngredientsModelCopyWithImpl<_IngredientsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientsModel&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text);

@override
String toString() {
  return 'IngredientsModel(type: $type, text: $text)';
}


}

/// @nodoc
abstract mixin class _$IngredientsModelCopyWith<$Res> implements $IngredientsModelCopyWith<$Res> {
  factory _$IngredientsModelCopyWith(_IngredientsModel value, $Res Function(_IngredientsModel) _then) = __$IngredientsModelCopyWithImpl;
@override @useResult
$Res call({
 String type,@IngredientsBlockTextConverter() String text
});




}
/// @nodoc
class __$IngredientsModelCopyWithImpl<$Res>
    implements _$IngredientsModelCopyWith<$Res> {
  __$IngredientsModelCopyWithImpl(this._self, this._then);

  final _IngredientsModel _self;
  final $Res Function(_IngredientsModel) _then;

/// Create a copy of IngredientsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = null,}) {
  return _then(_IngredientsModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
