import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/categories_provider/categories_provider.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/category_item.dart';
import 'package:foodieland/screens/home_screen/widgets/home_other_recipes_section.dart';
import 'package:foodieland/screens/home_screen/widgets/hot_recipe_item.dart';
import 'package:foodieland/screens/home_screen/widgets/instagram_section.dart';
import 'package:foodieland/screens/home_screen/widgets/own_kitchen_card.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_grid.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final categoryListAsync = ref.watch(categoryListProvider);
    final hotRecipeList = ref.watch(hotRecipesListProvider);
    final recipeList = ref.watch(recipeListProvider);
    // final recipe = ref.watch(recipeRiverpodProvider);
    final otherRecipesList = ref.watch(otherRecipesListProvider);
    return Center(
      child: Column(
        children: [
          hotRecipeList.when(
            data: (recipes) => SizedBox(
              height: 640,
              child: CarouselSlider.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index, realIndex) {
                  return HotRecipeItem(recipe: recipes[index]);
                },
                options: CarouselOptions(
                  height: 640,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.25,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enableInfiniteScroll: false,
                ),
              ),
            ),
            error: (error, _) => Text('Error: $error'),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1280.0),
            child: Column(
              children: [
                SizedBox(height: 160.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: 48.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(
                      // width: 200.0,
                      height: 60.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          backgroundColor: AppColors.lightBlue,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () => ref
                            .read(categoryListProvider.notifier)
                            .loadAllCategories(),
                        child: Text('View All Categories'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80.0),
                categoryListAsync.when(
                  data: (categories) => Wrap(
                    spacing: 40.0,
                    children: [
                      ...categories.map(
                        (category) => CategoryItem(category: category),
                      ),
                    ],
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error: $error'),
                ),
                Text(
                  'Simple and tasty recipes',
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 700.0),
                    child: Center(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim ',
                        style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.0),
                Row(mainAxisSize: MainAxisSize.min, children: []),
                SizedBox(height: 50.0),
                recipeList.when(
                  data: (recipes) {
                    return RecipeGrid(recipeList: recipes);
                  },
                  error: (error, stack) => Text('Error: $error'),
                  loading: () => CircularProgressIndicator(),
                ),
                OwnKitchenCard(),
                SizedBox(
                  width: double.infinity,
                    child: InstagramSection()),
                SizedBox(height: 160.0),
                HomeOtherRecipesSection(),
                SizedBox(height: 160.0),
                SubscriptionSection(),
                SizedBox(height: 160.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
