import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/categories_provider/categories_provider.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/home_recipes_providers.dart';
import 'package:foodieland/screens/home_screen/widgets/category_item.dart';
import 'package:foodieland/screens/home_screen/widgets/home_other_recipes_section.dart';
import 'package:foodieland/screens/home_screen/widgets/hot_recipes_carousel.dart';
import 'package:foodieland/screens/home_screen/widgets/instagram_section.dart';
import 'package:foodieland/screens/home_screen/widgets/own_kitchen_card.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_grid.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final categoryListAsync = ref.watch(categoryListProvider);
    final recipeList = ref.watch(recipeListProvider);
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isSmallLaptop = MediaQuery.of(context).size.width < 1100;
    final isSmallTablet = MediaQuery.of(context).size.width < 600;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: smallerThanDesktop ? 20.0 : 0,
        ),
        child: Column(
          children: [
            HotRecipesCarousel(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1280.0),
              child: Column(
                children: [
                  SizedBox(height: 160.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: smallerThanLaptop
                              ? 24.0
                              : smallerThanDesktop
                              ? 36.0
                              : 48.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(
                        // width: 200.0,
                        height: smallerThanLaptop
                            ? 30.0
                            : smallerThanDesktop
                            ? 40.0
                            : 60.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(smallerThanLaptop ? 8 : 16),
                            ),
                            textStyle: textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: smallerThanLaptop
                                  ? 12.0
                                  : smallerThanDesktop
                                  ? 14.0
                                  : 16.0,
                              color: Colors.black,
                            ),
                            backgroundColor: AppColors.lightBlue,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () => ref
                              .read(categoryListProvider.notifier)
                              .loadAllCategories(),
                          child: Text('View All Categories'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.0),
                  categoryListAsync.when(
                    data: (categories) => Wrap(
                      spacing: 40.0,
                      children: [
                        ...categories.map(
                          (category) => CategoryItem(category: category),
                        ),
                      ],
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => Text('Error: $error'),
                  ),
                  Text(
                    'Simple and tasty recipes',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: smallerThanLaptop
                          ? 24.0
                          : smallerThanDesktop
                          ? 36.0
                          : 48.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 700.0),
                      child: Center(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetuipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqut enim ad minim ',
                          style: textTheme.labelSmall!.copyWith(fontSize: smallerThanLaptop
                              ? 12.0
                              : smallerThanDesktop
                              ? 14.0
                              :  16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  recipeList.when(
                    data: (recipes) {
                      return RecipeGrid(crossAxisCount: smallerThanLaptop ? 2 : 3,recipeList: recipes,);
                    },
                    error: (error, stack) => Text('Error: $error'),
                    loading: () => CircularProgressIndicator(),
                  ),
                  OwnKitchenCard(),
                  SizedBox(width: double.infinity, child: InstagramSection()),
                  SizedBox(height: 160.0),
                  HomeOtherRecipesSection(),
                  SizedBox(height: 160.0),
                  SubscriptionSection(),
                  SizedBox(height: 160.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
