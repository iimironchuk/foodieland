// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      title: json['title'] as String,
      categoryImage: const ImagePathConverter().fromJson(
        json['categoryImage'] as Map<String, dynamic>?,
      ),
      backgroundColor: json['backgroundColor'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(
  _CategoryModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'categoryImage': const ImagePathConverter().toJson(instance.categoryImage),
  'backgroundColor': instance.backgroundColor,
};
