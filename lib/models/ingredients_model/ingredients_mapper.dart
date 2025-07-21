import 'package:foodieland/models/ingredients_model/ingredients_model.dart';

class IngredientsMapper {
  static List<IngredientsModel> fromJsonList(List<dynamic> jsonList) {
    final List<IngredientsModel> result = [];

    for (final block in jsonList) {
      final type = block['type'] as String?;
      final children = block['children'] as List<dynamic>?;

      if (type != null && children != null) {
        for (final child in children) {
          final text = child['text'];

          if (text != null && text is String) {
            result.add(IngredientsModel(type: type, text: text));
          }
        }
      }
    }

    return result;
  }
}
