import 'package:foodieland/utils/converters/date_time_converter.dart';
import 'package:foodieland/utils/converters/image_path_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  factory PostModel({
    required String title,
    required String description,
    required String authorName,
    @ImagePathConverter() required String authorAvatar,
    @ImagePathConverter() required String postAvatar,
    @DateTimeConverter() required DateTime publishedAt,
}) =_PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}