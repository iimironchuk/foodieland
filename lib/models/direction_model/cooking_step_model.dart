import 'package:freezed_annotation/freezed_annotation.dart';

part 'cooking_step_model.freezed.dart';

part 'cooking_step_model.g.dart';

enum StepBlockType { heading, paragraph, image }

@freezed
abstract class CookingStepModel with _$CookingStepModel {
  factory CookingStepModel({
    required StepBlockType type,
    required String content,
  }) = _CookingStepModel;

  factory CookingStepModel.fromJson(Map<String, dynamic> json) =>
      _$CookingStepModelFromJson(json);
}
