import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/blog_screen/blog_screen_providers/post_providers/post_providers.dart';
import 'package:foodieland/screens/blog_screen/blog_screen_providers/recipes_provider/blog_recipes_provider.dart';
import 'package:foodieland/screens/blog_screen/widgets/page_buttons_row.dart';
import 'package:foodieland/screens/blog_screen/widgets/post_list_builder.dart';
import 'package:foodieland/screens/blog_screen/widgets/search_text_field.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:foodieland/screens/widgets/three_other_recipe_section.dart';

class BlogScreen extends ConsumerWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final postListAsync = ref.watch(postOverviewProvider);
    final threeOtherRecipes = ref.watch(threeOtherRecipesBlogProvider);
    final postCountAsync = ref.watch(totalPostCountProvider);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Column(
          children: [
            SizedBox(height: 80.0),
            Text(
              'Blog & Article',
              style: textTheme.labelMedium!.copyWith(fontSize: 64.0),
            ),
            SizedBox(height: 24.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
              style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 80.0),
            SearchTextField(),
            SizedBox(height: 80.0),
            Wrap(
              spacing: 40.0,
              runSpacing: 40.0,
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
            SizedBox(height: 80.0),
            postCountAsync.when(
              data: (postCount) =>
                  PageButtonsRow(pageCount: (postCount / 6).ceil()),
                  // PageButtonsRow(pageCount: 10),
              error: (error, stack) => Text('Error: $error'),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(height: 160.0,),
            SubscriptionSection(),
            SizedBox(height: 160.0,),
          ],
        ),
      ),
    );
  }
}
