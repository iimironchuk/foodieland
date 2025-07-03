import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/app_wrapper.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/riverpod/recipe_riverpod/recipe_provider.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/categories_provider/categories_provider.dart';
import 'package:foodieland/screens/home_screen/home_screen_providers/recipes_providers/hot_recipes_provider.dart';
import 'package:foodieland/screens/home_screen/widgets/category_item.dart';
import 'package:foodieland/screens/home_screen/widgets/hot_recipe_item.dart';

import '../../riverpod/category_riverpod/category_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(categoryRiverpodProvider).getCategories();
    });

    Future.microtask(() {
      ref.read(recipeRiverpodProvider).getRecipesForOverview();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final categoryListAsync = ref.watch(categoryListProvider);
    final recipeList = ref.watch(hotRecipesListProvider);
    // final recipe = ref.watch(recipeRiverpodProvider);
    return AppWrapper(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Center(
          child: Column(
            children: [
              recipeList.when(
                data: (recipes) => SizedBox(
                  height: 640,
                  child: PageView(
                    children: [
                      ...recipes.map((recipe) => HotRecipeItem(recipe: recipe)),
                    ],
                  ),
                ),
                error: (error, _) => Text('Error: $error'),
                loading: () => CircularProgressIndicator(),
              ),
              SizedBox(height: 160.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 48.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(
                    // width: 200.0,
                    height: 60.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
