import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_grid.dart';
import 'package:foodieland/screens/recipes_screen/recipes_screen_providers/recipes_recipe_provider.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../resources/app_colors.dart';

class RecipesScreen extends ConsumerWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final recipeList = ref.watch(recipesScreenRecipeListProvider);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: smallerThanLaptop ? 8.0 : 0,
          ),
          child: Column(
            children: [
              SizedBox(height: 24.0,),
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
              SizedBox(height: 24.0,),
              recipeList.when(
                data: (recipes) => RecipeGrid(
                  crossAxisCount: smallerThanLaptop ? 2 : 3,
                  recipeList: recipes,
                ),
                error: (error, stack) => Text('Error: $error'),
                loading: () => CircularProgressIndicator(),
              ),
              SizedBox(height: 60.0),
              SizedBox(
                height: smallerThanLaptop
                    ? 40.0
                    : smallerThanDesktop
                    ? 50.0
                    : 60.0,
                child: ElevatedButton(
                  onPressed: () => ref.read(recipesScreenRecipeListProvider.notifier).loadMore(),
                  child: Text('Show more'),
                ),
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
