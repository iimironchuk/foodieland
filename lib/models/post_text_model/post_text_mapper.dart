import 'package:foodieland/models/post_text_model/post_text_model.dart';

class PostTextMapper {
  static List<PostTextModel> fromJsonList(List<dynamic> jsonList) {
    final List<PostTextModel> postTextModels = [];

    for (final block in jsonList) {
      final typeStr = block['type'] as String?;
      if (typeStr == null) continue;

      PostTextType? type;
      switch (typeStr) {
        case 'heading':
          type = PostTextType.heading;
          break;
        case 'paragraph':
          type = PostTextType.paragraph;
          break;
        case 'image':
          type = PostTextType.image;
          break;
      }

      final int? level = block['level'] as int?;

      if (type == null) continue;

      if (type == PostTextType.image) {
        final image = block['image'];
        final url = image?['url'];
        if (url != null && url is String && url.isNotEmpty) {
          postTextModels.add(PostTextModel(type: type, content: url));
        }
      } else {

        final children = block['children'];
        if (children is List && children.isNotEmpty) {
          for (var child in children) {
            final text = child['text'];

            if (text != null && text is String && text.trim().isNotEmpty) {
              postTextModels.add(
                PostTextModel(type: type, content: text.trim(), level: level),
              );
            }
          }
        }
      }
    }

    return postTextModels;
  }
}
