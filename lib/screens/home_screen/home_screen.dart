import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/app_wrapper.dart';
import 'package:foodieland/riverpod/recipe_riverpod/recipe_provider.dart';
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
    final categoryItem = ref.watch(categoryRiverpodProvider);
    final recipe = ref.watch(recipeRiverpodProvider);
    return AppWrapper(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Center(
          child: Column(
            children: [
              // ListView.builder(itemBuilder: (context, index){}),
              SizedBox(height: 100),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItem.categories.length,
                  itemBuilder: (context, index) {
                    final category = categoryItem.categories[index];
                    return Padding(
                      padding: EdgeInsets.only(right:  index != categoryItem.categories.length - 1 ? 40.0 : 0),
                      child: CategoryItem(category: category),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
