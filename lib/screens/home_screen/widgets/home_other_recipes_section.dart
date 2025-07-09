import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';

class HomeOtherRecipesSection extends ConsumerWidget {
  const HomeOtherRecipesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final otherRecipesList = ref.watch(otherRecipesListProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 560.0),
              child: Text(
                'Try this delicious recipe to make your day',
                style: textTheme.labelMedium!.copyWith(fontSize: 48.0),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 620.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim',
                style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
              ),
            ),
          ],
        ),
        SizedBox(height: 80.0),
        otherRecipesList.when(
          data: (recipes) => GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 40.0,
              mainAxisSpacing: 40.0,
              childAspectRatio: 290 / 316,
            ),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeItem(
                recipe: recipes[index],
                toggleFavorite: () => ref
                    .read(recipeListProvider.notifier)
                    .toggleFavorite(recipes[index]),
                titleFontSize: 18.0,
                infoFontSize: 14.0,
                isGradientNeeded: false,
              );
            },
          ),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ],
    );
  }
}
