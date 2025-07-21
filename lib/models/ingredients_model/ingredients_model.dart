import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/converters/ingredients_block_text_converter.dart';

part 'ingredients_model.freezed.dart';
part 'ingredients_model.g.dart';

@freezed
abstract class IngredientsModel with _$IngredientsModel {
  factory IngredientsModel({
    required String type,
    @IngredientsBlockTextConverter() required String text,
}) = _IngredientsModel;

  factory IngredientsModel.fromJson(Map<String, dynamic> json) => _$IngredientsModelFromJson(json);
}