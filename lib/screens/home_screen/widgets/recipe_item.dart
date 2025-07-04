import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';

class RecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeItem({super.key, required this.recipe});

  Widget _buildInfoIconRow(TextTheme textTheme, String asset, String info) {
    return Row(
      children: [
        SvgPicture.asset(asset),
        SizedBox(width: 10.0),
        Text(
          info,
          style: textTheme.labelSmall!.copyWith(
            fontSize: 14.0,
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
        gradient: LinearGradient(
          colors: [
            AppColors.scaffold,
            AppColors.lightBlue.withValues(alpha: 0),
            AppColors.lightBlue.withValues(alpha: 0.1),
          ],
          stops: [0.0, 0.0, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 368 / 250,
              child: CachedNetworkImage(
                imageUrl: recipe.recipeAvatar,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              recipe.title,
              style: textTheme.labelMedium!.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                _buildInfoIconRow(
                  textTheme,
                  Assets.icons.duration,
                  '${recipe.duration} Minutes',
                ),
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
