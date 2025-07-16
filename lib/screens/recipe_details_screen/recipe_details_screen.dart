import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/recipe_details_provider/recipe_details_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/video_player_provider/video_player_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/nutrition_information.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/overview_details_row.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';

class RecipeDetailsScreen extends ConsumerStatefulWidget {
  final String recipeId;

  const RecipeDetailsScreen({super.key, required this.recipeId});

  @override
  ConsumerState<RecipeDetailsScreen> createState() =>
      _RecipeVideoPlayerWidgetState();
}

class _RecipeVideoPlayerWidgetState
    extends ConsumerState<RecipeDetailsScreen> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context, ) {
    final recipeAsync = ref.watch(recipeWithDetailsProvider(widget.recipeId));
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
                final controller = ref
                    .read(
                      RecipeVideoPlayerProvider(recipe.videoRecipe).notifier,
                    )
                    .controller;
                return Column(
                  children: [
                    Text(
                      recipe.title,
                      style: textTheme.labelMedium!.copyWith(
                        fontSize: smallerThanLaptop
                            ? 28.0
                            : smallerThanDesktop
                            ? 46.0
                            : 64.0,
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
                                    child: MouseRegion(
                                      onEnter: (_) => setState(() => _isHovered = true ),
                                        onExit: (_) => setState(() => _isHovered = false ),
                                        child: VideoPlayer(controller)),
                                  ),
                                  if (isPlaying && _isHovered)
                                    Center(
                                      child: Container(
                                        width: 120.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withValues(
                                            alpha: 0.5,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () => ref
                                              .read(
                                                RecipeVideoPlayerProvider(
                                                  recipe.videoRecipe,
                                                ).notifier,
                                              )
                                              .pauseVideo(),
                                          icon: Icon(
                                            Icons.pause,
                                            color: AppColors.lightGrey,
                                            size: 50.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  // if (_isHovered && isPaused)
                                  //   Center(
                                  //     child: Container(
                                  //       width: 120.0,
                                  //       height: 120.0,
                                  //       decoration: BoxDecoration(
                                  //         shape: BoxShape.circle,
                                  //         color: Colors.grey.withValues(
                                  //           alpha: 0.5,
                                  //         ),
                                  //       ),
                                  //       child: IconButton(
                                  //         onPressed: () => ref
                                  //             .read(
                                  //           RecipeVideoPlayerProvider(
                                  //             recipe.videoRecipe,
                                  //           ).notifier,
                                  //         )
                                  //             .playVideo(),
                                  //         icon: Icon(
                                  //           Icons.play_arrow,
                                  //           color: AppColors.lightGrey,
                                  //           size: 50.0,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
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
                    ElevatedButton(
                      onPressed: () => ref
                          .read(
                            RecipeVideoPlayerProvider(
                              recipe.videoRecipe,
                            ).notifier,
                          )
                          .pauseVideo(),
                      child: Text('Pause'),
                    ),
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
