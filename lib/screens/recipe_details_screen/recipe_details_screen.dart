import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/recipe_details_provider/recipe_details_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/video_player_provider/video_player_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/directions_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/ingredients_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/nutrition_information.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/other_recipe_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/overview_details_row.dart';
import 'package:foodieland/screens/widgets/other_recipes_grid.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailsScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherRecipesAsync = ref.watch(otherThreeRecipesProvider);
    final recipeAsync = ref.watch(recipeWithDetailsProvider(recipeId));
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: Column(
          children: [
            recipeAsync.when(
              data: (recipe) {
                ref.watch(RecipeVideoPlayerProvider(recipe.videoRecipe));

                final isPlaying = ref
                    .read(
                      RecipeVideoPlayerProvider(recipe.videoRecipe).notifier,
                    )
                    .isPlaying;
                final isPaused = ref
                    .read(
                      RecipeVideoPlayerProvider(recipe.videoRecipe).notifier,
                    )
                    .isPaused;
                final otherCategoryRecipesAsync = ref.watch(
                  otherRecipesByCategoryProvider(recipe.category.title),
                );

                final chewieController = ref
                    .read(
                      RecipeVideoPlayerProvider(recipe.videoRecipe).notifier,
                    )
                    .chewieController;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        recipe.title,
                        style: textTheme.labelMedium!.copyWith(
                          fontSize: smallerThanLaptop
                              ? 28.0
                              : smallerThanDesktop
                              ? 46.0
                              : 64.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    OverviewDetailsRow(
                      authorImageUrl: recipe.authorAvatar,
                      date: recipe.publishedAt,
                      authorName: recipe.authorName,
                      prepTime: recipe.prepTime,
                      cookTime: recipe.cookTime,
                      category: recipe.category.title,
                    ),
                    SizedBox(height: 64.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          // height: 600,
                          // width: 840,
                          child: AspectRatio(
                            aspectRatio: 840 / 600,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Chewie(controller: chewieController),
                                  ),
                                  if (!isPlaying && !isPaused)
                                    Positioned.fill(
                                      child: CachedNetworkImage(
                                        imageUrl: recipe.recipeAvatar,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (!isPlaying && !isPaused)
                                    Center(
                                      child: Container(
                                        width: 120.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(
                                            255,
                                            255,
                                            255,
                                            0.8,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () => ref
                                              .read(
                                                RecipeVideoPlayerProvider(
                                                  recipe.videoRecipe,
                                                ).notifier,
                                              )
                                              .playVideo(),
                                          icon: Icon(
                                            Icons.play_arrow,
                                            color: AppColors.lightGrey,
                                            size: 50.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 40.0),
                        Expanded(
                          flex: 1,
                          // width: 400,
                          child: NutritionInformation(
                            calories: recipe.calories,
                            totalFat: recipe.totalFat,
                            protein: recipe.protein,
                            carbohydrate: recipe.carbohydrate,
                            cholesterol: recipe.cholesterol,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 80.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          recipe.description,
                          style: textTheme.labelSmall!.copyWith(fontSize: 16.0),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),

                    Wrap(
                      spacing: 40.0,
                      runSpacing: 40.0,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 840.0),
                          child: IngredientsSection(
                            ingredients: recipe.ingredients,
                          ),
                        ),
                        otherRecipesAsync.when(
                          data: (recipes) => ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 400),
                            child: OtherRecipeSection(recipes: recipes),
                          ),
                          error: (error, stack) => Text('Error: $error'),
                          loading: () => CircularProgressIndicator(),
                        ),
                      ],
                    ),
                    SizedBox(height: 88.0),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 840.0),
                      child: DirectionsSection(steps: recipe.directions),
                    ),
                    SizedBox(height: 160.0),
                    SubscriptionSection(),
                    SizedBox(height: 160.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'You may like these recipe too',
                        style: textTheme.labelMedium!.copyWith(fontSize: 36.0),
                      ),
                    ),
                    SizedBox(height: 80.0),
                    otherCategoryRecipesAsync.when(
                      data: (recipes) => OtherRecipesGrid(recipes: recipes),
                      error: (error, stack) => Text(error.toString()),
                      loading: () => CircularProgressIndicator(),
                    ),
                    SizedBox(height: 160.0),
                  ],
                );
              },
              error: (error, stack) => Text('Error: $error'),
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
