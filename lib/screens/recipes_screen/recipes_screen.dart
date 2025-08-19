import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/providers/search_providers/search_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_grid.dart';
import 'package:foodieland/screens/recipes_screen/recipes_screen_providers/favorite_recipes_provider/favorite_recipes_provider.dart';
import 'package:foodieland/screens/recipes_screen/recipes_screen_providers/recipes_recipe_provider.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/category_model/category_model.dart';
import '../../providers/favorites_provider/favorites_provider.dart';
import '../../resources/app_colors.dart';

class RecipesScreen extends ConsumerWidget {
  const RecipesScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final CategoryModel? categoryForFilter = ref.watch(
      categoryForFilterProvider,
    );
    final recipeList = ref.watch(
      recipesScreenRecipeListProvider(categoryForFilter),
    );
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final hasReachedEnd = ref
        .read(recipesScreenRecipeListProvider(categoryForFilter).notifier)
        .hasReachedEnd;

    final favoritesAsync = ref.watch(
      recipeScreenFavoritesProvider(categoryForFilter),
    );
    final hasFavReachedEnd = ref
        .watch(recipeScreenFavoritesProvider(categoryForFilter).notifier)
        .hasReachedEnd;

    final showFav = ref.watch(showOnlyFavoritesProvider);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: smallerThanLaptop ? 20.0 : 0,
          ),
          child: Column(
            children: [
              SizedBox(height: 24.0),
              Text(
                'Simple and tasty recipes',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: smallerThanLaptop
                      ? 24.0
                      : smallerThanDesktop
                      ? 36.0
                      : 48.0,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 700.0),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim ',
                      style: textTheme.labelSmall!.copyWith(
                        fontSize: smallerThanLaptop
                            ? 12.0
                            : smallerThanDesktop
                            ? 14.0
                            : 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36.0),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Show only favorites',
                      style: textTheme.labelMedium!.copyWith(fontSize: isMobile
                          ? 12.0
                          : smallerThanDesktop
                          ? 18.0 : 24.0),
                    ),
                    SizedBox(width: 24.0),
                    Switch(
                      activeTrackColor: AppColors.lightBlue,
                      value: showFav,
                      onChanged: (value) {
                        ref.read(showOnlyFavoritesProvider.notifier).state =
                            value;
                        ref.invalidate(
                          recipeScreenFavoritesProvider(categoryForFilter),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (categoryForFilter != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: smallerThanLaptop
                          ? 40.0
                          : smallerThanDesktop
                          ? 50.0
                          : 60.0,
                      child: ElevatedButton(
                        onPressed: () =>
                            ref.read(categoryForFilterProvider.notifier).state =
                                null,
                        child: Text('See all recipes'),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 24.0),
              showFav
                  ? favoritesAsync.when(
                      data: (recipes) {
                        if (recipes.isEmpty) {
                          return Center(
                            child: Text(
                              'You have no favorite recipes yet!',
                              style: textTheme.labelSmall!.copyWith(
                                fontSize: smallerThanLaptop
                                    ? 12.0
                                    : smallerThanDesktop
                                    ? 14.0
                                    : 16.0,
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: [
                            RecipeGrid(
                              crossAxisCount: smallerThanLaptop ? 2 : 3,
                              recipeList: recipes,
                              toggleFavorite: (recipe) => ref
                                  .read(favoriteRecipesProvider.notifier)
                                  .toggle(recipe),
                            ),
                            SizedBox(
                              height: isMobile
                                  ? 15.0
                                  : smallerThanDesktop
                                  ? 30.0
                                  : 60.0,
                            ),
                            hasFavReachedEnd
                                ? SizedBox()
                                : ElevatedButton(
                                    onPressed: () => ref
                                        .read(
                                          recipeScreenFavoritesProvider(
                                            categoryForFilter,
                                          ).notifier,
                                        )
                                        .loadMore(categoryForFilter),
                                    child: Text('Show more'),
                                  ),
                          ],
                        );
                      },
                      error: (error, stack) => Text('Error: $error'),
                      loading: () => SizedBox(),
                    )
                  : recipeList.when(
                      data: (recipes) {
                        return Column(
                          children: [
                            RecipeGrid(
                              crossAxisCount: smallerThanLaptop ? 2 : 3,
                              recipeList: recipes,
                              toggleFavorite: (recipe) => ref
                                  .read(favoriteRecipesProvider.notifier)
                                  .toggle(recipe),
                            ),
                            SizedBox(
                              height: isMobile
                                  ? 15.0
                                  : smallerThanDesktop
                                  ? 30.0
                                  : 60.0,
                            ),
                            hasReachedEnd
                                ? SizedBox()
                                : ElevatedButton(
                                    onPressed: () => ref
                                        .read(
                                          recipesScreenRecipeListProvider(
                                            categoryForFilter,
                                          ).notifier,
                                        )
                                        .loadMore(categoryForFilter),
                                    child: Text('Show more'),
                                  ),
                          ],
                        );
                      },
                      error: (error, stack) => Text('Error: $error'),
                      loading: () => CircularProgressIndicator(),
                    ),

              SizedBox(height: 60.0),
              SubscriptionSection(),
              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
