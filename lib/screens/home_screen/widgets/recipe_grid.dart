import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/navigation/routes.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecipeGrid extends ConsumerWidget {
  final int crossAxisCount;
  final List<RecipeModel> recipeList;

  const RecipeGrid({
    super.key,
    required this.crossAxisCount,
    required this.recipeList,
  });

  void _goToDetails(BuildContext context, String recipeId) {
    RecipeDetailRoute(id: recipeId).go(context);
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
    final isLittleBiggerThanMobile = MediaQuery.of(context).size.width < 550.0;

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    double getAspectRatio() {
      if (isLittleBiggerThanMobile) {
        return 400 / 540;
      } else if (isVerySmallLaptop) {
        return 400 / 550;
      } else if (isSmallLaptop || isSmallTablet) {
        return 400 / 460;
      }
      return 400 / 434;
    }

    int adCount = (recipeList.length / 5).floor();

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipeList.length + adCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: isSmallTablet
            ? 10.0
            : smallerThanLaptop
            ? 20.0
            : 40.0,
        crossAxisSpacing: isSmallTablet
            ? 10.0
            : smallerThanLaptop
            ? 20.0
            : 40.0,
        childAspectRatio: getAspectRatio(),
      ),
      itemBuilder: (context, index) {
        if ((index + 1) % 6 == 0) {
          return Assets.images.advertisment.image();
        }
        final numOfAdsBefore = (index / 6).floor();
        final recipeIndex = index - numOfAdsBefore;

        return GestureDetector(
          onTap: () =>
              _goToDetails(context, recipeList[recipeIndex].documentId),
          child: RecipeItem(
            titleFontSize: isMobile
                ? 12.0
                : smallerThanLaptop
                ? 16.0
                : smallerThanDesktop
                ? 18.0
                : 24.0,
            infoFontSize: smallerThanLaptop
                ? 10.0
                : smallerThanDesktop
                ? 12.0
                : 14.0,
            isGradientNeeded: true,
            recipe: recipeList[recipeIndex],
            toggleFavorite: () => ref
                .read(recipeListProvider.notifier)
                .toggleFavorite(recipeList[recipeIndex]),
          ),
        );
      },
    );
  }
}
