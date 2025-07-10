import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_grid.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeOtherRecipesSection extends ConsumerWidget {
  const HomeOtherRecipesSection({super.key});

  Widget _buildTitleContent({
    required TextTheme textTheme,
    required bool smallerThanLaptop,
    required double titleFontSize,
    required double descriptionFontSize,
  }) {
    final children = [
      Flexible(
        child: Text(
          'Try this delicious recipe to make your day',
          style: textTheme.labelMedium!.copyWith(fontSize: titleFontSize),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
      SizedBox(height: 20.0, width: 20.0),
      Flexible(
        child: Text(
          'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim',
          style: textTheme.labelSmall!.copyWith(fontSize: descriptionFontSize),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    ];

    return smallerThanLaptop
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
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
    final textTheme = Theme.of(context).textTheme;
    final otherRecipesList = ref.watch(otherRecipesListProvider);
    double getAspectRatio() {
      if (isSmallMobile) {
        return 290 / 390;
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
        _buildTitleContent(
          textTheme: textTheme,
          smallerThanLaptop: smallerThanDesktop,
          titleFontSize: smallerThanLaptop
              ? 24.0
              : smallerThanDesktop
              ? 36.0
              : 48.0,
          descriptionFontSize: smallerThanLaptop
              ? 12.0
              : smallerThanDesktop
              ? 14.0
              : 16.0,
        ),
        SizedBox(height: 80.0),
        otherRecipesList.when(
          data: (recipes) => GridView.builder(
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
              return RecipeItem(
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
