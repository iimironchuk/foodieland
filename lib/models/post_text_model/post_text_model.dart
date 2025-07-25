import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_text_model.freezed.dart';

part 'post_text_model.g.dart';

enum PostTextType { image, heading, paragraph }

@freezed
abstract class PostTextModel with _$PostTextModel {
  factory PostTextModel({
    required PostTextType type,
    required String content,
    int? level,
  }) = _PostTextModel;

  factory PostTextModel.fromJson(Map<String, dynamic> json) =>
      _$PostTextModelFromJson(json);
}
