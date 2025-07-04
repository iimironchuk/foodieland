import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/home_screen/widgets/info_with_icon_container.dart';
import 'package:intl/intl.dart';

class HotRecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const HotRecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1280/640,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      // color: AppColors.lightBlue,
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.scaffold,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Assets.images.hotRecipe.image(),
                                  SizedBox(width: 13.0),
                                  Text(
                                    'Hot Recipes',
                                    style: textTheme.labelMedium!.copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                            child: Text(
                              recipe.title,
                              style: textTheme.labelMedium!.copyWith(fontSize: 64.0),
                              maxLines: 2,
                            ),
                          ),
                          Text(recipe.description, style: textTheme.labelSmall!.copyWith(fontSize: 16.0)),
                          SizedBox(height: 30.0,),
                          Row(
                            children: [
                              InfoWithIconContainer(
                                icon: Assets.icons.duration,
                                info: '${recipe.duration} minutes',
                              ),
                              SizedBox(width: 16.0,),
                              InfoWithIconContainer(
                                icon: Assets.icons.recipeCategory,
                                info: recipe.category.title,
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: recipe.authorAvatar,
                                    fit: BoxFit.cover,
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    recipe.authorName,
                                    style: textTheme.labelMedium!.copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    DateFormat(
                                      'd MMMM yyyy',
                                    ).format(recipe.publishedAt),
                                    style: textTheme.labelSmall!.copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                width: 200.0,
                                height: 60.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                    backgroundColor: Colors.black,
                                    foregroundColor: AppColors.scaffold,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'View Recipe',
                                    style: textTheme.labelSmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      color: AppColors.scaffold
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: OverflowBox(
                      maxWidth: double.infinity,
                      alignment: Alignment(1, 0),
                      child: CachedNetworkImage(
                        imageUrl: recipe.recipeAvatar,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        // width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 50.0,
          left: 565,
          //   right: 0,
          child: Assets.images.badge.image(),
        ),
      ],
    );
  }
}
