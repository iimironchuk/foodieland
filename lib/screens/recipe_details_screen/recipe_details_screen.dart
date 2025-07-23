import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/recipe_details_provider/recipe_details_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/video_player_provider/video_player_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/directions_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/ingredients_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/nutrition_information.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/other_recipe_section.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/overview_details_row.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/video_widget.dart';
import 'package:foodieland/screens/widgets/other_recipes_grid.dart';
import 'package:foodieland/screens/widgets/subscription_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/recipe_model/recipe_model.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailsScreen({super.key, required this.recipeId});

  //   @override
  //   ConsumerState<RecipeDetailsScreen> createState() =>
  //       _RecipeDetailsScreenState();
  // }
  //
  // class _RecipeDetailsScreenState extends ConsumerState<RecipeDetailsScreen> {
  //   late final RecipeModel currentRecipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherRecipesAsync = ref.watch(otherThreeRecipesProvider(recipeId));
    final recipeAsync = ref.watch(recipeWithDetailsProvider(recipeId));
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280.0),
        child: recipeAsync.when(
          data: (recipe) {
            final videoAsync = ref.watch(
              RecipeVideoPlayerProvider(recipe.videoRecipe),
            );
            final isVideoInitialized = ref
                .watch(RecipeVideoPlayerProvider(recipe.videoRecipe).notifier)
                .isVideoInitialized;

            final otherCategoryRecipesAsync = ref.watch(
              otherRecipesByCategoryProvider(recipe.category.title),
            );

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: smallerThanDesktop ? 16.0 : 0,
              ),
              child: Column(
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
                  SizedBox(
                    height: smallerThanLaptop
                        ? 20.0
                        : smallerThanDesktop
                        ? 30.0
                        : 50.0,
                  ),
                  OverviewDetailsRow(
                    authorImageUrl: recipe.authorAvatar,
                    date: recipe.publishedAt,
                    authorName: recipe.authorName,
                    prepTime: recipe.prepTime,
                    cookTime: recipe.cookTime,
                    category: recipe.category.title,
                  ),
                  SizedBox(
                    height: smallerThanLaptop
                        ? 28.0
                        : smallerThanDesktop
                        ? 46.0
                        : 64.0,
                  ),
                  smallerThanLaptop
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            recipe.videoRecipe.isEmpty || !isVideoInitialized
                                ? AspectRatio(
                                    aspectRatio: 840 / 600,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                        imageUrl: recipe.recipeAvatar,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : VideoWidget(
                                    videoUrl: recipe.videoRecipe,
                                    recipeAvatar: recipe.recipeAvatar,
                                    playVideo: () => ref
                                        .read(
                                          RecipeVideoPlayerProvider(
                                            recipe.videoRecipe,
                                          ).notifier,
                                        )
                                        .playVideo(),
                                  ),
                            SizedBox(height: 40.0),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 400.0,
                                maxHeight: isMobile ? 350.0 : 600.0,
                              ),
                              child: NutritionInformation(
                                calories: recipe.calories,
                                totalFat: recipe.totalFat,
                                protein: recipe.protein,
                                carbohydrate: recipe.carbohydrate,
                                cholesterol: recipe.cholesterol,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child:
                                  recipe.videoRecipe.isEmpty ||
                                      !isVideoInitialized
                                  ? AspectRatio(
                                      aspectRatio: 840 / 600,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: CachedNetworkImage(
                                          imageUrl: recipe.recipeAvatar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : VideoWidget(
                                      videoUrl: recipe.videoRecipe,
                                      recipeAvatar: recipe.recipeAvatar,
                                      playVideo: () => ref
                                          .read(
                                            RecipeVideoPlayerProvider(
                                              recipe.videoRecipe,
                                            ).notifier,
                                          )
                                          .playVideo(),
                                    ),
                            ),
                            SizedBox(
                              width: smallerThanLaptop
                                  ? 20.0
                                  : smallerThanDesktop
                                  ? 30.0
                                  : 40.0,
                            ),
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
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile
                          ? 20.0
                          : smallerThanDesktop
                          ? 40.0
                          : 80.0,
                    ),
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
                  SizedBox(
                    height: isMobile
                        ? 22.0
                        : smallerThanDesktop
                        ? 44.0
                        : 88.0,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 840.0),
                    child: DirectionsSection(steps: recipe.directions),
                  ),
                  SizedBox(
                    height: isMobile
                        ? 40.0
                        : smallerThanDesktop
                        ? 80.0
                        : 160.0,
                  ),
                  SubscriptionSection(),
                  SizedBox(
                    height: isMobile
                        ? 40.0
                        : smallerThanDesktop
                        ? 80.0
                        : 160.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'You may like these recipe too',
                      style: textTheme.labelMedium!.copyWith(fontSize: 36.0),
                    ),
                  ),
                  SizedBox(
                    height: isMobile
                        ? 20.0
                        : smallerThanDesktop
                        ? 40.0
                        : 80.0,
                  ),
                  otherCategoryRecipesAsync.when(
                    data: (recipes) => OtherRecipesGrid(recipes: recipes),
                    error: (error, stack) => Text(error.toString()),
                    loading: () => CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: isMobile
                        ? 40.0
                        : smallerThanDesktop
                        ? 80.0
                        : 160.0,
                  ),
                ],
              ),
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
