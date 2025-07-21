import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_grid.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../navigation/routes.dart';

class OtherRecipesGrid extends ConsumerWidget {
  final List<RecipeModel> recipes;

  const OtherRecipesGrid({super.key, required this.recipes});

  void _goToAnotherRecipe(String recipeId, BuildContext context) {
    final path = RecipeDetailRoute(id: recipeId).location;
    context.push(path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isSmallLaptop =
        MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width > 800;
    final isVerySmallLaptop =
        MediaQuery.of(context).size.width < 900 &&
        MediaQuery.of(context).size.width > 800;

    final isSmallTablet = MediaQuery.of(context).size.width < 650;
    final isSmallMobile = MediaQuery.of(context).size.width < 380;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    double getAspectRatio() {
      if (isSmallMobile) {
        return 290 / 380;
      } else if (isMobile) {
        return 290 / 330;
      } else if (isSmallTablet) {
        return 290 / 330;
      } else if (isTablet) {
        return 290 / 290;
      } else if (isVerySmallLaptop) {
        return 290 / 430;
      } else if (isSmallLaptop) {
        return 290 / 400;
      }
      return 290 / 316;
    }

    return Column(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: smallerThanLaptop ? 2 : 4,
            crossAxisSpacing: isSmallTablet
                ? 10.0
                : smallerThanLaptop
                ? 20.0
                : 40.0,
            mainAxisSpacing: isSmallTablet
                ? 10.0
                : smallerThanLaptop
                ? 20.0
                : 40.0,
            childAspectRatio: getAspectRatio(),
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  _goToAnotherRecipe(recipes[index].documentId, context),
              child: RecipeItem(
                recipe: recipes[index],
                toggleFavorite: () => ref
                    .read(recipeListProvider.notifier)
                    .toggleFavorite(recipes[index]),
                titleFontSize: isTablet
                    ? 16.0
                    : smallerThanLaptop
                    ? 12.0
                    : smallerThanDesktop
                    ? 15.0
                    : 18.0,
                infoFontSize: smallerThanLaptop
                    ? 10.0
                    : smallerThanDesktop
                    ? 12.0
                    : 14.0,
                isGradientNeeded: false,
              ),
            );
          },
        ),
      ],
    );
  }
}
