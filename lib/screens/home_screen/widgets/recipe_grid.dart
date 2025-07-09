import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';

class RecipeGrid extends ConsumerWidget {
  final List<RecipeModel> recipeList;

  const RecipeGrid({super.key, required this.recipeList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipeList.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 40.0,
        crossAxisSpacing: 40.0,
        childAspectRatio: 400 / 434,
      ),
      itemBuilder: (context, index) {
        if (index == 5) {
          return Assets.images.advertisment.image();
        }

        final adjustedIndex = index > 5 ? index - 1 : index;
        return RecipeItem(
          titleFontSize: 24.0,
          infoFontSize: 14.0,
          isGradientNeeded: true,
          recipe: recipeList[adjustedIndex],
          toggleFavorite: () => ref
              .read(recipeListProvider.notifier)
              .toggleFavorite(recipeList[adjustedIndex]),
        );
      },
    );
  }
}
