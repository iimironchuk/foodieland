import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/models/post_model/post_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:intl/intl.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 290.0, maxHeight: 200.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: post.postAvatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 40.0),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 510.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: textTheme.labelMedium!.copyWith(fontSize: 24.0),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16.0),
              Text(
                post.description,
                style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 32.0),
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: post.authorAvatar,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Text(
                        post.authorName,
                        style: textTheme.labelMedium!.copyWith(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SizedBox(
                      height: 40.0,
                      child: VerticalDivider(color: AppColors.veryLightGrey),
                    ),
                  ),
                  Text(
                    DateFormat('d MMMM yyyy').format(post.publishedAt),
                    style: textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
