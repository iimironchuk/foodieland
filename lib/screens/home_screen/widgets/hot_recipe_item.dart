import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/home_screen/widgets/info_with_icon_container.dart';

class HotRecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const HotRecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        SizedBox(
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
                  child: Column(
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

                      Text(
                        recipe.title,
                        style: textTheme.labelMedium!.copyWith(fontSize: 64.0),
                      ),
                      Text(recipe.description, style: textTheme.labelSmall),
                      Row(
                        children: [
                          InfoWithIconContainer(
                            icon: Assets.icons.duration,
                            info: recipe.duration.toString(),
                          ),
                          InfoWithIconContainer(icon: Assets.icons.recipeCategory, info: recipe.mealType)
                        ],
                      ),
                    ],
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
