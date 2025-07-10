import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';

class RecipeSmallScreenCarousel extends ConsumerWidget {
  const RecipeSmallScreenCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeList = ref.watch(recipeListProvider);
    return recipeList.when(
      data: (recipes) {
        return CarouselSlider(
          items: [
            ...recipes.map(
              (recipe) => RecipeItem(
                titleFontSize: 18.0,
                infoFontSize: 12.0,
                isGradientNeeded: true,
                recipe: recipe,
                toggleFavorite: () => ref
                    .read(recipeListProvider.notifier)
                    .toggleFavorite(recipe),
              ),
            ),
          ],
          options: CarouselOptions(

          ),
        );
      },
      error: (error, stack) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
