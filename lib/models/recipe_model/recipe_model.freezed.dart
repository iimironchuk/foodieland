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

 int get id; String get documentId; String get title; int get duration; String get description; String get authorName; CategoryModel get category;@ImagePathConverter() String get authorAvatar;@ImagePathConverter() String get recipeAvatar; bool get isHotRecipe;@DateTimeConverter() DateTime get publishedAt; bool get isFavorite; int get prepTime; int get cookTime;@ImagePathConverter() String get videoRecipe; double get calories; double get protein; double get totalFat; double get carbohydrate; double get cholesterol;@JsonKey(includeFromJson: false, includeToJson: false) List<IngredientsModel> get ingredients;@JsonKey(includeFromJson: false, includeToJson: false) List<CookingStepModel> get directions;
/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeModelCopyWith<RecipeModel> get copyWith => _$RecipeModelCopyWithImpl<RecipeModel>(this as RecipeModel, _$identity);

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.category, category) || other.category == category)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.recipeAvatar, recipeAvatar) || other.recipeAvatar == recipeAvatar)&&(identical(other.isHotRecipe, isHotRecipe) || other.isHotRecipe == isHotRecipe)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.prepTime, prepTime) || other.prepTime == prepTime)&&(identical(other.cookTime, cookTime) || other.cookTime == cookTime)&&(identical(other.videoRecipe, videoRecipe) || other.videoRecipe == videoRecipe)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.totalFat, totalFat) || other.totalFat == totalFat)&&(identical(other.carbohydrate, carbohydrate) || other.carbohydrate == carbohydrate)&&(identical(other.cholesterol, cholesterol) || other.cholesterol == cholesterol)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.directions, directions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,documentId,title,duration,description,authorName,category,authorAvatar,recipeAvatar,isHotRecipe,publishedAt,isFavorite,prepTime,cookTime,videoRecipe,calories,protein,totalFat,carbohydrate,cholesterol,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(directions)]);

@override
String toString() {
  return 'RecipeModel(id: $id, documentId: $documentId, title: $title, duration: $duration, description: $description, authorName: $authorName, category: $category, authorAvatar: $authorAvatar, recipeAvatar: $recipeAvatar, isHotRecipe: $isHotRecipe, publishedAt: $publishedAt, isFavorite: $isFavorite, prepTime: $prepTime, cookTime: $cookTime, videoRecipe: $videoRecipe, calories: $calories, protein: $protein, totalFat: $totalFat, carbohydrate: $carbohydrate, cholesterol: $cholesterol, ingredients: $ingredients, directions: $directions)';
}


}

/// @nodoc
abstract mixin class $RecipeModelCopyWith<$Res>  {
  factory $RecipeModelCopyWith(RecipeModel value, $Res Function(RecipeModel) _then) = _$RecipeModelCopyWithImpl;
@useResult
$Res call({
 int id, String documentId, String title, int duration, String description, String authorName, CategoryModel category,@ImagePathConverter() String authorAvatar,@ImagePathConverter() String recipeAvatar, bool isHotRecipe,@DateTimeConverter() DateTime publishedAt, bool isFavorite, int prepTime, int cookTime,@ImagePathConverter() String videoRecipe, double calories, double protein, double totalFat, double carbohydrate, double cholesterol,@JsonKey(includeFromJson: false, includeToJson: false) List<IngredientsModel> ingredients,@JsonKey(includeFromJson: false, includeToJson: false) List<CookingStepModel> directions
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$RecipeModelCopyWithImpl<$Res>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._self, this._then);

  final RecipeModel _self;
  final $Res Function(RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? title = null,Object? duration = null,Object? description = null,Object? authorName = null,Object? category = null,Object? authorAvatar = null,Object? recipeAvatar = null,Object? isHotRecipe = null,Object? publishedAt = null,Object? isFavorite = null,Object? prepTime = null,Object? cookTime = null,Object? videoRecipe = null,Object? calories = null,Object? protein = null,Object? totalFat = null,Object? carbohydrate = null,Object? cholesterol = null,Object? ingredients = null,Object? directions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,authorAvatar: null == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String,recipeAvatar: null == recipeAvatar ? _self.recipeAvatar : recipeAvatar // ignore: cast_nullable_to_non_nullable
as String,isHotRecipe: null == isHotRecipe ? _self.isHotRecipe : isHotRecipe // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,prepTime: null == prepTime ? _self.prepTime : prepTime // ignore: cast_nullable_to_non_nullable
as int,cookTime: null == cookTime ? _self.cookTime : cookTime // ignore: cast_nullable_to_non_nullable
as int,videoRecipe: null == videoRecipe ? _self.videoRecipe : videoRecipe // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,totalFat: null == totalFat ? _self.totalFat : totalFat // ignore: cast_nullable_to_non_nullable
as double,carbohydrate: null == carbohydrate ? _self.carbohydrate : carbohydrate // ignore: cast_nullable_to_non_nullable
as double,cholesterol: null == cholesterol ? _self.cholesterol : cholesterol // ignore: cast_nullable_to_non_nullable
as double,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientsModel>,directions: null == directions ? _self.directions : directions // ignore: cast_nullable_to_non_nullable
as List<CookingStepModel>,
  ));
}
/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RecipeModel implements RecipeModel {
   _RecipeModel({required this.id, required this.documentId, required this.title, required this.duration, required this.description, required this.authorName, required this.category, @ImagePathConverter() required this.authorAvatar, @ImagePathConverter() required this.recipeAvatar, this.isHotRecipe = false, @DateTimeConverter() required this.publishedAt, this.isFavorite = false, this.prepTime = 0, this.cookTime = 0, @ImagePathConverter() required this.videoRecipe, this.calories = 0.0, this.protein = 0.0, this.totalFat = 0.0, this.carbohydrate = 0.0, this.cholesterol = 0.0, @JsonKey(includeFromJson: false, includeToJson: false) final  List<IngredientsModel> ingredients = const [], @JsonKey(includeFromJson: false, includeToJson: false) final  List<CookingStepModel> directions = const []}): _ingredients = ingredients,_directions = directions;
  factory _RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);

@override final  int id;
@override final  String documentId;
@override final  String title;
@override final  int duration;
@override final  String description;
@override final  String authorName;
@override final  CategoryModel category;
@override@ImagePathConverter() final  String authorAvatar;
@override@ImagePathConverter() final  String recipeAvatar;
@override@JsonKey() final  bool isHotRecipe;
@override@DateTimeConverter() final  DateTime publishedAt;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  int prepTime;
@override@JsonKey() final  int cookTime;
@override@ImagePathConverter() final  String videoRecipe;
@override@JsonKey() final  double calories;
@override@JsonKey() final  double protein;
@override@JsonKey() final  double totalFat;
@override@JsonKey() final  double carbohydrate;
@override@JsonKey() final  double cholesterol;
 final  List<IngredientsModel> _ingredients;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<IngredientsModel> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<CookingStepModel> _directions;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<CookingStepModel> get directions {
  if (_directions is EqualUnmodifiableListView) return _directions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directions);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.category, category) || other.category == category)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.recipeAvatar, recipeAvatar) || other.recipeAvatar == recipeAvatar)&&(identical(other.isHotRecipe, isHotRecipe) || other.isHotRecipe == isHotRecipe)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.prepTime, prepTime) || other.prepTime == prepTime)&&(identical(other.cookTime, cookTime) || other.cookTime == cookTime)&&(identical(other.videoRecipe, videoRecipe) || other.videoRecipe == videoRecipe)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.totalFat, totalFat) || other.totalFat == totalFat)&&(identical(other.carbohydrate, carbohydrate) || other.carbohydrate == carbohydrate)&&(identical(other.cholesterol, cholesterol) || other.cholesterol == cholesterol)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._directions, _directions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,documentId,title,duration,description,authorName,category,authorAvatar,recipeAvatar,isHotRecipe,publishedAt,isFavorite,prepTime,cookTime,videoRecipe,calories,protein,totalFat,carbohydrate,cholesterol,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_directions)]);

@override
String toString() {
  return 'RecipeModel(id: $id, documentId: $documentId, title: $title, duration: $duration, description: $description, authorName: $authorName, category: $category, authorAvatar: $authorAvatar, recipeAvatar: $recipeAvatar, isHotRecipe: $isHotRecipe, publishedAt: $publishedAt, isFavorite: $isFavorite, prepTime: $prepTime, cookTime: $cookTime, videoRecipe: $videoRecipe, calories: $calories, protein: $protein, totalFat: $totalFat, carbohydrate: $carbohydrate, cholesterol: $cholesterol, ingredients: $ingredients, directions: $directions)';
}


}

/// @nodoc
abstract mixin class _$RecipeModelCopyWith<$Res> implements $RecipeModelCopyWith<$Res> {
  factory _$RecipeModelCopyWith(_RecipeModel value, $Res Function(_RecipeModel) _then) = __$RecipeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String documentId, String title, int duration, String description, String authorName, CategoryModel category,@ImagePathConverter() String authorAvatar,@ImagePathConverter() String recipeAvatar, bool isHotRecipe,@DateTimeConverter() DateTime publishedAt, bool isFavorite, int prepTime, int cookTime,@ImagePathConverter() String videoRecipe, double calories, double protein, double totalFat, double carbohydrate, double cholesterol,@JsonKey(includeFromJson: false, includeToJson: false) List<IngredientsModel> ingredients,@JsonKey(includeFromJson: false, includeToJson: false) List<CookingStepModel> directions
});


@override $CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$RecipeModelCopyWithImpl<$Res>
    implements _$RecipeModelCopyWith<$Res> {
  __$RecipeModelCopyWithImpl(this._self, this._then);

  final _RecipeModel _self;
  final $Res Function(_RecipeModel) _then;

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? title = null,Object? duration = null,Object? description = null,Object? authorName = null,Object? category = null,Object? authorAvatar = null,Object? recipeAvatar = null,Object? isHotRecipe = null,Object? publishedAt = null,Object? isFavorite = null,Object? prepTime = null,Object? cookTime = null,Object? videoRecipe = null,Object? calories = null,Object? protein = null,Object? totalFat = null,Object? carbohydrate = null,Object? cholesterol = null,Object? ingredients = null,Object? directions = null,}) {
  return _then(_RecipeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,authorAvatar: null == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String,recipeAvatar: null == recipeAvatar ? _self.recipeAvatar : recipeAvatar // ignore: cast_nullable_to_non_nullable
as String,isHotRecipe: null == isHotRecipe ? _self.isHotRecipe : isHotRecipe // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,prepTime: null == prepTime ? _self.prepTime : prepTime // ignore: cast_nullable_to_non_nullable
as int,cookTime: null == cookTime ? _self.cookTime : cookTime // ignore: cast_nullable_to_non_nullable
as int,videoRecipe: null == videoRecipe ? _self.videoRecipe : videoRecipe // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,totalFat: null == totalFat ? _self.totalFat : totalFat // ignore: cast_nullable_to_non_nullable
as double,carbohydrate: null == carbohydrate ? _self.carbohydrate : carbohydrate // ignore: cast_nullable_to_non_nullable
as double,cholesterol: null == cholesterol ? _self.cholesterol : cholesterol // ignore: cast_nullable_to_non_nullable
as double,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientsModel>,directions: null == directions ? _self._directions : directions // ignore: cast_nullable_to_non_nullable
as List<CookingStepModel>,
  ));
}

/// Create a copy of RecipeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
