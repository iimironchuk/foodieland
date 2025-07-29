// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {

 String get documentId; String get title; String get description; String get authorName;@ImagePathConverter() String get authorAvatar;@ImagePathConverter() String get postAvatar;@DateTimeConverter() DateTime get publishedAt;@JsonKey(includeFromJson: false, includeToJson: false) List<PostTextModel> get postTextList;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.postAvatar, postAvatar) || other.postAvatar == postAvatar)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&const DeepCollectionEquality().equals(other.postTextList, postTextList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentId,title,description,authorName,authorAvatar,postAvatar,publishedAt,const DeepCollectionEquality().hash(postTextList));

@override
String toString() {
  return 'PostModel(documentId: $documentId, title: $title, description: $description, authorName: $authorName, authorAvatar: $authorAvatar, postAvatar: $postAvatar, publishedAt: $publishedAt, postTextList: $postTextList)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
 String documentId, String title, String description, String authorName,@ImagePathConverter() String authorAvatar,@ImagePathConverter() String postAvatar,@DateTimeConverter() DateTime publishedAt,@JsonKey(includeFromJson: false, includeToJson: false) List<PostTextModel> postTextList
});




}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentId = null,Object? title = null,Object? description = null,Object? authorName = null,Object? authorAvatar = null,Object? postAvatar = null,Object? publishedAt = null,Object? postTextList = null,}) {
  return _then(_self.copyWith(
documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: null == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String,postAvatar: null == postAvatar ? _self.postAvatar : postAvatar // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,postTextList: null == postTextList ? _self.postTextList : postTextList // ignore: cast_nullable_to_non_nullable
as List<PostTextModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostModel implements PostModel {
   _PostModel({required this.documentId, required this.title, required this.description, required this.authorName, @ImagePathConverter() required this.authorAvatar, @ImagePathConverter() required this.postAvatar, @DateTimeConverter() required this.publishedAt, @JsonKey(includeFromJson: false, includeToJson: false) final  List<PostTextModel> postTextList = const []}): _postTextList = postTextList;
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override final  String documentId;
@override final  String title;
@override final  String description;
@override final  String authorName;
@override@ImagePathConverter() final  String authorAvatar;
@override@ImagePathConverter() final  String postAvatar;
@override@DateTimeConverter() final  DateTime publishedAt;
 final  List<PostTextModel> _postTextList;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<PostTextModel> get postTextList {
  if (_postTextList is EqualUnmodifiableListView) return _postTextList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_postTextList);
}


/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatar, authorAvatar) || other.authorAvatar == authorAvatar)&&(identical(other.postAvatar, postAvatar) || other.postAvatar == postAvatar)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&const DeepCollectionEquality().equals(other._postTextList, _postTextList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentId,title,description,authorName,authorAvatar,postAvatar,publishedAt,const DeepCollectionEquality().hash(_postTextList));

@override
String toString() {
  return 'PostModel(documentId: $documentId, title: $title, description: $description, authorName: $authorName, authorAvatar: $authorAvatar, postAvatar: $postAvatar, publishedAt: $publishedAt, postTextList: $postTextList)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
 String documentId, String title, String description, String authorName,@ImagePathConverter() String authorAvatar,@ImagePathConverter() String postAvatar,@DateTimeConverter() DateTime publishedAt,@JsonKey(includeFromJson: false, includeToJson: false) List<PostTextModel> postTextList
});




}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentId = null,Object? title = null,Object? description = null,Object? authorName = null,Object? authorAvatar = null,Object? postAvatar = null,Object? publishedAt = null,Object? postTextList = null,}) {
  return _then(_PostModel(
documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatar: null == authorAvatar ? _self.authorAvatar : authorAvatar // ignore: cast_nullable_to_non_nullable
as String,postAvatar: null == postAvatar ? _self.postAvatar : postAvatar // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,postTextList: null == postTextList ? _self._postTextList : postTextList // ignore: cast_nullable_to_non_nullable
as List<PostTextModel>,
  ));
}


}

// dart format on
