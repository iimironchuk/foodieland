import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/post_text_model/post_text_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/post_details_screen/post_details_providers/post_details_providers.dart';
import 'package:foodieland/screens/post_details_screen/widgets/post_content_builder.dart';
import 'package:foodieland/screens/post_details_screen/widgets/share_column.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PostDetailsScreen extends ConsumerWidget {
  final String postId;

  const PostDetailsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final postDetailsAsync = ref.watch(postWithDetailsProvider(postId));
    double smallSizedBoxHeight() {
      return isMobile
          ? 20.0
          : smallerThanDesktop
          ? 40.0
          : 80.0;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: smallerThanDesktop ? 18.0 : 0,
          ),
          child: Column(
            children: [
              postDetailsAsync.when(
                data: (post) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: smallSizedBoxHeight()),
                      Text(
                        'Full Guide to Becoming a Professional Chef',
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: isMobile
                              ? 24.0
                              : smallerThanDesktop
                              ? 48.0
                              : 64.0,
                        ),
                      ),
                      SizedBox(height: 32.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: post.authorAvatar,
                              fit: BoxFit.cover,
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Text(
                            post.authorName,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: VerticalDivider(
                                color: AppColors.veryLightGrey,
                              ),
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: isMobile ? 24.0 : 48.0,
                          bottom: isMobile ? 32.0 : 64.0,
                        ),
                        child: Text(
                          post.description,
                          style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1280.0 / 600.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            imageUrl: post.postAvatar,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(height: smallSizedBoxHeight()),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 50.0,
                              runSpacing: 30.0,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 940.0),
                              child: PostContentBuilder(
                                postContent: post.postTextList,
                              ),
                            ),

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: smallerThanDesktop ? 180.0 : 140.0,
                              ),
                              child: Center(child: ShareColumn()),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 40.0),
                    ],
                  );
                },
                error: (error, stack) {
                  return Text('Error: $error');
                },
                loading: () => Center(child: CircularProgressIndicator()),
              ),
              SubscriptionSection(),
              SizedBox(height: 160.0),
            ],
          ),
        ),
      ),
    );
  }
}
