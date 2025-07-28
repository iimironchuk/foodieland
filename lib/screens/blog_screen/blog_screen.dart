import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/blog_screen/blog_screen_providers/post_providers/post_providers.dart';
import 'package:foodieland/screens/blog_screen/blog_screen_providers/recipes_provider/blog_recipes_provider.dart';
import 'package:foodieland/screens/blog_screen/widgets/page_buttons_row.dart';
import 'package:foodieland/screens/blog_screen/widgets/post_list_builder.dart';
import 'package:foodieland/screens/blog_screen/widgets/search_text_field.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:foodieland/screens/widgets/three_other_recipe_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'blog_screen_providers/text_provider/text_provider.dart';

class BlogScreen extends ConsumerWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final searchedText = ref.read(textProvider);
    final postListAsync = ref.watch(postOverviewProvider(searchedText));
    final threeOtherRecipes = ref.watch(threeOtherRecipesBlogProvider);
    final postCountAsync = ref.watch(totalPostCountProvider(searchedText));
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    double smallSizedBoxHeight() {
      return isMobile
          ? 20.0
          : smallerThanDesktop
          ? 40.0
          : 80.0;
    }

    double bigSizedBoxHeight() {
      return isMobile
          ? 40.0
          : smallerThanDesktop
          ? 80.0
          : 160.0;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: smallerThanDesktop ? 20.0 : 0,
          ),
          child: Column(
            children: [
              SizedBox(height: smallSizedBoxHeight()),
              Text(
                'Blog & Article',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: isMobile
                      ? 24.0
                      : smallerThanDesktop
                      ? 48.0
                      : 64.0,
                ),
              ),
              SizedBox(
                height: isMobile
                    ? 12.0
                    : smallerThanDesktop
                    ? 18.0
                    : 24.0,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                style: textTheme.labelSmall!.copyWith(
                  fontSize: isMobile ? 13.0 : 16.0,
                ),
              ),
              SizedBox(height: smallSizedBoxHeight()),
              SearchTextField(
                onSearch: (value) => ref.read(textProvider.notifier).state = value,
                onSubmitted: (value) => ref.read(textProvider.notifier).state = value,
              ),
              SizedBox(height: smallSizedBoxHeight()),
              // Wrap(
              //   spacing: 40.0,
              //   runSpacing: 40.0,
              //   children: [
              //     postListAsync.when(
              //       data: (posts) =>
              //           PostListBuilder(posts: posts, onPostTap: () {}),
              //       error: (error, stack) => Text('Error: $error'),
              //       loading: () => CircularProgressIndicator(),
              //     ),
              //     threeOtherRecipes.when(
              //       data: (recipes) => ThreeOtherRecipeSection(
              //         recipes: recipes,
              //         title: 'Tasty Recipes',
              //       ),
              //       error: (error, stack) => Text('Error: $error'),
              //       loading: () => CircularProgressIndicator(),
              //     ),
              //   ],
              // ),
              smallerThanDesktop
                  ? Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: postListAsync.when(
                            data: (posts) =>
                                PostListBuilder(posts: posts, onPostTap: () {}),
                            error: (error, stack) => Text('Error: $error'),
                            loading: () => CircularProgressIndicator(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: postCountAsync.when(
                            data: (postCount) => PageButtonsRow(
                              pageCount: (postCount / 6).ceil(),
                            ),
                            // PageButtonsRow(pageCount: 10),
                            error: (error, stack) => Text('Error: $error'),
                            loading: () => CircularProgressIndicator(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: threeOtherRecipes.when(
                            data: (recipes) => ThreeOtherRecipeSection(
                              recipes: recipes,
                              title: 'Tasty Recipes',
                            ),
                            error: (error, stack) => Text('Error: $error'),
                            loading: () => CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        postListAsync.when(
                          data: (posts) =>
                              PostListBuilder(posts: posts, onPostTap: () {}),
                          error: (error, stack) => Text('Error: $error'),
                          loading: () => CircularProgressIndicator(),
                        ),
                        threeOtherRecipes.when(
                          data: (recipes) => ThreeOtherRecipeSection(
                            recipes: recipes,
                            title: 'Tasty Recipes',
                          ),
                          error: (error, stack) => Text('Error: $error'),
                          loading: () => CircularProgressIndicator(),
                        ),
                      ],
                    ),
              SizedBox(height: smallSizedBoxHeight()),
              if (!smallerThanDesktop)
                postCountAsync.when(
                  data: (postCount) =>
                      PageButtonsRow(pageCount: (postCount / 6).ceil()),
                  // PageButtonsRow(pageCount: 10),
                  error: (error, stack) => Text('Error: $error'),
                  loading: () => CircularProgressIndicator(),
                ),
              SizedBox(height: bigSizedBoxHeight()),
              SubscriptionSection(),
              SizedBox(height: bigSizedBoxHeight()),
            ],
          ),
        ),
      ),
    );
  }
}
