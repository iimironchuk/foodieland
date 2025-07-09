import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';

class RecipeItem extends StatelessWidget {
  final double titleFontSize;
  final double infoFontSize;

  final VoidCallback toggleFavorite;
  final RecipeModel recipe;
  final bool isGradientNeeded;

  const RecipeItem({
    super.key,
    required this.recipe,
    required this.toggleFavorite,
    required this.titleFontSize,
    required this.infoFontSize,
    required this.isGradientNeeded,
  });

  Widget _buildInfoIconRow(TextTheme textTheme, String asset, String info) {
    return Row(
      children: [
        SvgPicture.asset(asset),
        SizedBox(width: 10.0),
        Text(
          info,
          style: textTheme.labelSmall!.copyWith(
            fontSize: infoFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        // color: AppColors.lightBlue,
        gradient: isGradientNeeded
            ? LinearGradient(
                colors: [
                  AppColors.scaffold,
                  // AppColors.lightBlue.withValues(alpha: 0),
                  AppColors.lightBlue,
                ],
                stops: [0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(isGradientNeeded ? 16.0 : 0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 368 / 250,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      imageUrl: recipe.recipeAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    right: 20.0,
                    child: GestureDetector(
                      onTap: toggleFavorite,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.scaffold,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            Assets.icons.favorite,
                            colorFilter: ColorFilter.mode(
                              recipe.isFavorite
                                  ? Colors.red
                                  : AppColors.lightGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 24.0,
                top: isGradientNeeded ? 24.0 : 16.0,
              ),
              child: Text(
                recipe.title,
                style: textTheme.labelMedium!.copyWith(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
            ),
            Row(
              children: [
                _buildInfoIconRow(
                  textTheme,
                  Assets.icons.duration,
                  '${recipe.duration} Minutes',
                ),
                SizedBox(width: 24.0),
                _buildInfoIconRow(
                  textTheme,
                  Assets.icons.recipeCategory,
                  recipe.category.title,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
