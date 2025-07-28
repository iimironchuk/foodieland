import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/models/post_model/post_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  // Widget _buildAuthorRow(TextThe){
  //   final children = [
  //     Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         SizedBox(
  //           width: isMobile ? 30.0 : 40.0,
  //           height: isMobile ? 30.0 : 40.0,
  //           child: ClipOval(
  //             child: CachedNetworkImage(
  //               imageUrl: post.authorAvatar,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: isMobile
  //               ? 10.0
  //               : isTablet
  //               ? 13.0
  //               : 16.0,
  //         ),
  //         Text(
  //           post.authorName,
  //           style: textTheme.labelMedium!.copyWith(
  //             fontSize: isMobile
  //                 ? 12.0
  //                 : isTablet
  //                 ? 14.0
  //                 : 16.0,
  //           ),
  //         ),
  //       ],
  //     ),
  //     Padding(
  //       padding: EdgeInsets.symmetric(
  //         horizontal: isMobile
  //             ? 12.0
  //             : isTablet
  //             ? 18.0
  //             : 24.0,
  //       ),
  //       child: SizedBox(
  //         height: isMobile ? 25.0 : 40.0,
  //         child: VerticalDivider(color: AppColors.veryLightGrey),
  //       ),
  //     ),
  //     Text(
  //       DateFormat('d MMMM yyyy').format(post.publishedAt),
  //       style: textTheme.labelSmall!.copyWith(
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile
                ? 150.0
                : isTablet
                ? 220.0
                : 290.0,
            maxHeight: isMobile
                ? 130.0
                : isTablet
                ? 150.0
                : 200.0,
          ),
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
        SizedBox(
          width: isMobile
              ? 10.0
              : isTablet
              ? 20.0
              : 40.0,
        ),

        Expanded(
          // constraints: BoxConstraints(maxWidth: 510.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: textTheme.labelMedium!.copyWith(
                  fontSize: isMobile
                      ? 14.0
                      : isTablet
                      ? 18.0
                      : 24.0,
                ),
                maxLines: isMobile ? 2 :1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: isMobile
                    ? 8.0
                    : isTablet
                    ? 12.0
                    : 16.0,
              ),
              Text(
                post.description,
                style: textTheme.labelSmall!.copyWith(
                  fontSize: isMobile
                      ? 10.0
                      : isTablet
                      ? 12.0
                      : 16.0,
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: isMobile
                    ? 8.0
                    : isTablet
                    ? 16.0
                    : 32.0,
              ),
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: isMobile
                            ? 25.0
                            : isTablet
                            ? 30.0
                            : 40.0,
                        height: isMobile
                            ? 25.0
                            : isTablet
                            ? 30.0
                            : 40.0,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: post.authorAvatar,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: isMobile
                            ? 10.0
                            : isTablet
                            ? 13.0
                            : 16.0,
                      ),
                      Text(
                        post.authorName,
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: isMobile
                              ? 12.0
                              : isTablet
                              ? 14.0
                              : 16.0,
                        ),
                      ),
                    ],
                  ),
                  if(!isMobile) Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile
                          ? 12.0
                          : isTablet
                          ? 18.0
                          : 24.0,
                    ),
                    child: SizedBox(
                      height: isMobile ? 25.0 : 40.0,
                      child: VerticalDivider(color: AppColors.veryLightGrey),
                    ),
                  ),
                  if(!isMobile) Flexible(
                    child: Text(
                      DateFormat('d MMMM yyyy').format(post.publishedAt),
                      style: textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile
                            ? 10.0
                            : isTablet
                            ? 12.0
                            : 14.0,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
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
