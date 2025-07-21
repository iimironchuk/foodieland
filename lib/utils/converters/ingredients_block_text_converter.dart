import 'package:freezed_annotation/freezed_annotation.dart';

class IngredientsBlockTextConverter
    implements JsonConverter<String, Map<String, dynamic>?> {
  const IngredientsBlockTextConverter();

  @override
  String fromJson(Map<String, dynamic>? json) {
    if (json != null && json['text'] != null) {
      return json['text'] as String;
    } else {
      return '';
    }
  }

  @override
  Map<String, dynamic>? toJson(String object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
