import 'package:flutter/material.dart';
import 'package:foodieland/models/post_model/post_model.dart';
import 'package:foodieland/screens/blog_screen/widgets/post_item.dart';

class PostListBuilder extends StatelessWidget {
  final List<PostModel> posts;
  final VoidCallback onPostTap;

  const PostListBuilder({super.key, required this.posts, required this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 840.0,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onPostTap,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: PostItem(post: posts[index]),
              ));
        },
      ),
    );
  }
}
