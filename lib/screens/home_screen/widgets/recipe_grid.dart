import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/navigation/routes.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecipeGrid extends ConsumerWidget {
  final int crossAxisCount;
  final List<RecipeModel> recipeList;
  final void Function(RecipeModel) toggleFavorite;

  const RecipeGrid({
    super.key,
    required this.crossAxisCount,
    required this.recipeList,
    required this.toggleFavorite,
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
        MediaQuery.of(context).size.width < 1000 &&
        MediaQuery.of(context).size.width > 800;
    final isSmallTablet =
        MediaQuery.of(context).size.width < 650 &&
        MediaQuery.of(context).size.width > 480;

    final isVerySmallTablet =
        MediaQuery.of(context).size.width < 555 &&
        MediaQuery.of(context).size.width > 480;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    final isSmallMobile = MediaQuery.of(context).size.width < 420;

    double getAspectRatio() {
      if (isSmallMobile) {
        return 400 / 540;
      } else if (isMobile) {
        return 400 / 490;
      } else if (isVerySmallTablet) {
        return 400 / 540;
      } else if (isSmallTablet) {
        return 400 / 480;
      } else if (isTablet) {
        return 400 / 420;
      } else if (isSmallLaptop) {
        return 400 / 480;
      } else if (smallerThanDesktop) {
        return 400 / 450;
      }
      return 400 / 440;
    }

    int adCount = (recipeList.length / 5).floor();

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipeList.length + adCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: isMobile
            ? 10.0
            : smallerThanLaptop
            ? 20.0
            : 40.0,
        crossAxisSpacing: isMobile
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
        final recipe = recipeList[recipeIndex];

        return GestureDetector(
          onTap: () => _goToDetails(context, recipe.documentId),
          child: RecipeItem(
            titleFontSize:
            isMobile
                ? 12.0
                :  isSmallTablet ? 14.0 : smallerThanLaptop
                ? 16.0
                : smallerThanDesktop
                ? 18.0
                : 24.0,
            infoFontSize:
            isSmallTablet
                ? 12.0
                : isTablet
                ? 14.0
                : smallerThanLaptop
                ? 10.0
                : smallerThanDesktop
                ? 12.0
                : 14.0,
            isGradientNeeded: true,
            recipe: recipeList[recipeIndex],
            toggleFavorite: (recipe) => toggleFavorite(recipe),
          ),
        );
      },
    );
  }
}
