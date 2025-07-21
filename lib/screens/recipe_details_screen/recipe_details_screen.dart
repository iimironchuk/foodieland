import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/recipe_details_provider/recipe_details_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/video_player_provider/video_player_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/ingredients_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/nutrition_information.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/other_recipe_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/overview_details_row.dart';
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
                final videoPlayerAsync = ref.watch(
                  RecipeVideoPlayerProvider(recipe.videoRecipe),
                );

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
                final isStopped = ref
                    .read(
                      RecipeVideoPlayerProvider(recipe.videoRecipe).notifier,
                    )
                    .isStopped;

                final chewieController = ref
                    .read(
                      RecipeVideoPlayerProvider(recipe.videoRecipe).notifier,
                    )
                    .chewieController;

                return Column(
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
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 2,
                    //       // constraints: BoxConstraints(maxWidth: 840.0),
                    //       child: IngredientsSection(
                    //         ingredients: recipe.ingredients,
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       // constraints: BoxConstraints(maxWidth: 400.0),
                    //       child: otherRecipesAsync.when(
                    //         data: (recipes) => OtherRecipeSection(recipes: recipes),
                    //         error: (error, stack) => Text('Error: $error'),
                    //         loading: () => CircularProgressIndicator(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    IngredientsSection(ingredients: recipe.ingredients),

                    // otherRecipesAsync.when(
                    //   data: (recipes) => ConstrainedBox(
                    //     constraints: BoxConstraints(maxWidth: 400),
                    //       child: OtherRecipeSection(recipes: recipes)),
                    //   error: (error, stack) => Text('Error: $error'),
                    //   loading: () => CircularProgressIndicator(),
                    // ),

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
