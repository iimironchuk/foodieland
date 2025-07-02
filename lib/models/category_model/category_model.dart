import 'package:foodieland/utils/converters/image_path_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required String title,
    @ImagePathConverter() required String categoryImage,
    required String backgroundColor,
}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

}