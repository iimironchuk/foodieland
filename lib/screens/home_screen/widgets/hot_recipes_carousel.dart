import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'hot_recipe_item.dart';

class HotRecipesCarousel extends ConsumerWidget {
  const HotRecipesCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final smallerThanTablet = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(TABLET);
    final hotRecipeList = ref.watch(hotRecipesListProvider);
    return hotRecipeList.when(
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
    );
  }
}
