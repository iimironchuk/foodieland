// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeModel {

 String get title; int get duration; String get description; String get mealType; String get authorName;@ImagePathConverter() String get authorAvatar;@ImagePathConverter() String get recipeAvatar; bool get isHotRecipe;
/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeModelCopyWith<RecipeModel> get copyWith => _$RecipeModelCopyWithImpl<RecipeModel>(this as RecipeModel, _$identity);

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeModel&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.recipeAvatar, recipeAvatar) || other.recipeAvatar == recipeAvatar)&&(identical(other.isHotRecipe, isHotRecipe) || other.isHotRecipe == isHotRecipe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,duration,description,mealType,authorName,authorAvatar,recipeAvatar,isHotRecipe);

@override
String toString() {
  return 'RecipeModel(title: $title, duration: $duration, description: $description, mealType: $mealType, authorName: $authorName, authorAvatar: $authorAvatar, recipeAvatar: $recipeAvatar, isHotRecipe: $isHotRecipe)';
}


}

/// @nodoc
abstract mixin class $RecipeModelCopyWith<$Res>  {
  factory $RecipeModelCopyWith(RecipeModel value, $Res Function(RecipeModel) _then) = _$RecipeModelCopyWithImpl;
@useResult
$Res call({
 String title, int duration, String description, String mealType, String authorName,@ImagePathConverter() String authorAvatar,@ImagePathConverter() String recipeAvatar, bool isHotRecipe
});




}
/// @nodoc
class _$RecipeModelCopyWithImpl<$Res>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._self, this._then);

  final RecipeModel _self;
  final $Res Function(RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? duration = null,Object? description = null,Object? mealType = null,Object? authorName = null,Object? authorAvatar = null,Object? recipeAvatar = null,Object? isHotRecipe = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: null == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String,recipeAvatar: null == recipeAvatar ? _self.recipeAvatar : recipeAvatar // ignore: cast_nullable_to_non_nullable
as String,isHotRecipe: null == isHotRecipe ? _self.isHotRecipe : isHotRecipe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipeModel implements RecipeModel {
   _RecipeModel({required this.title, required this.duration, required this.description, required this.mealType, required this.authorName, @ImagePathConverter() required this.authorAvatar, @ImagePathConverter() required this.recipeAvatar, this.isHotRecipe = false});
  factory _RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

@override final  String title;
@override final  int duration;
@override final  String description;
@override final  String mealType;
@override final  String authorName;
@override@ImagePathConverter() final  String authorAvatar;
@override@ImagePathConverter() final  String recipeAvatar;
@override@JsonKey() final  bool isHotRecipe;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeModelCopyWith<_RecipeModel> get copyWith => __$RecipeModelCopyWithImpl<_RecipeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeModel&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.mealType, mealType) || other.mealType == mealType)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.recipeAvatar, recipeAvatar) || other.recipeAvatar == recipeAvatar)&&(identical(other.isHotRecipe, isHotRecipe) || other.isHotRecipe == isHotRecipe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,duration,description,mealType,authorName,authorAvatar,recipeAvatar,isHotRecipe);

@override
String toString() {
  return 'RecipeModel(title: $title, duration: $duration, description: $description, mealType: $mealType, authorName: $authorName, authorAvatar: $authorAvatar, recipeAvatar: $recipeAvatar, isHotRecipe: $isHotRecipe)';
}


}

/// @nodoc
abstract mixin class _$RecipeModelCopyWith<$Res> implements $RecipeModelCopyWith<$Res> {
  factory _$RecipeModelCopyWith(_RecipeModel value, $Res Function(_RecipeModel) _then) = __$RecipeModelCopyWithImpl;
@override @useResult
$Res call({
 String title, int duration, String description, String mealType, String authorName,@ImagePathConverter() String authorAvatar,@ImagePathConverter() String recipeAvatar, bool isHotRecipe
});




}
/// @nodoc
class __$RecipeModelCopyWithImpl<$Res>
    implements _$RecipeModelCopyWith<$Res> {
  __$RecipeModelCopyWithImpl(this._self, this._then);

  final _RecipeModel _self;
  final $Res Function(_RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? duration = null,Object? description = null,Object? mealType = null,Object? authorName = null,Object? authorAvatar = null,Object? recipeAvatar = null,Object? isHotRecipe = null,}) {
  return _then(_RecipeModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mealType: null == mealType ? _self.mealType : mealType // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: null == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String,recipeAvatar: null == recipeAvatar ? _self.recipeAvatar : recipeAvatar // ignore: cast_nullable_to_non_nullable
as String,isHotRecipe: null == isHotRecipe ? _self.isHotRecipe : isHotRecipe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
