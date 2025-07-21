import 'package:foodieland/models/direction_model/cooking_step_model.dart';

class CookingStepMapper {
  static List<CookingStepModel> fromJsonList(List<dynamic> jsonList) {
    List<CookingStepModel> steps = [];

    for (final block in jsonList) {
      final typeStr = block['type'] as String?;
      if (typeStr == null) continue;

      StepBlockType? type;
      switch (typeStr) {
        case 'heading':
          type = StepBlockType.heading;
          break;
        case 'paragraph':
          type = StepBlockType.paragraph;
          break;
        case 'image':
          type = StepBlockType.image;
          break;
      }

      if (type == null) continue;

      if (type == StepBlockType.image) {
        final image = block['image'];
        final url = image?['url'];
        if (url != null && url is String && url.isNotEmpty) {
          steps.add(CookingStepModel(type: type, content: url));
        }
      } else {
        final children = block['children'];
        if (children is List && children.isNotEmpty) {
          for (var child in children) {
            final text = child['text'];
            if (text != null && text is String && text.trim().isNotEmpty) {
              steps.add(CookingStepModel(type: type, content: text.trim()));
            }
          }
        }
      }
    }

    return steps;
  }
}
