import 'package:flutter/material.dart';
import 'package:foodieland/models/post_text_model/post_text_model.dart';
import 'package:foodieland/screens/post_details_screen/widgets/italic_text_with_container.dart';
import 'package:foodieland/screens/post_details_screen/widgets/post_content_image.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PostContentBuilder extends StatelessWidget {
  final List<PostTextModel> postContent;

  const PostContentBuilder({super.key, required this.postContent});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints
        .of(context)
        .isMobile;
    final isTablet = ResponsiveBreakpoints
        .of(context)
        .isTablet;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 920.0),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: postContent.length,
          itemBuilder: (context, index) {
            final text = postContent[index];
            if (text.type == PostTextType.heading) {
              if (text.level == 4) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    text.content,
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: isMobile ? 16.0 : 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              } else if (text.level == 3) {
                return ItalicTextWithContainer(text: text.content);
              }
            } else if (text.type == PostTextType.image) {
              return PostContentImage(
                imageUrl: text.content,
                bottomPadding: isMobile ? 20.0 : 32.0,
                aspectRatio
                : smallerThanLaptop ? 840/600 : 840 / 400,);
            } else {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: isMobile ? 30.0 : isTablet ? 45.0 : 60.0),
                child: Text(
                  text.content,
                  style: textTheme.labelSmall!.copyWith(
                      fontSize: isMobile ? 12.0 : 16.0),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
