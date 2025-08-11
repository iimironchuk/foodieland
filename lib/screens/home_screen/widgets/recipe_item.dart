import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../providers/favorites_provider/favorites_provider.dart';

class RecipeItem extends ConsumerWidget {
  final double titleFontSize;
  final double infoFontSize;

  final void Function(RecipeModel) toggleFavorite;
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

  Widget _buildInfoIconRow(
    TextTheme textTheme,
    String asset,
    String info,
    bool isMobile,
  ) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          width: isMobile ? 15.0 : null,
          height: isMobile ? 15.0 : null,
        ),
        SizedBox(width: isMobile ? 5.0 : 10.0),
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
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      isRecipeFavoriteProvider(recipe.id.toString()),
    );
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
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
        borderRadius: BorderRadius.circular(smallerThanLaptop ? 20.0 : 30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isGradientNeeded ? (isMobile ? 5.0 : 16) : 0,
          vertical: isGradientNeeded ? 16 : 0,
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 368 / 250,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      smallerThanLaptop ? 20.0 : 30,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: recipe.recipeAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: smallerThanLaptop ? 10.0 : 20.0,
                    right: smallerThanLaptop ? 10.0 : 20.0,
                    child: GestureDetector(
                      onTap: () => toggleFavorite(recipe),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.scaffold,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(isMobile ? 6.0 : 12.0),
                          child: SvgPicture.asset(
                            Assets.icons.favorite,
                            width: isMobile ? 15.0 : null,
                            height: isMobile ? 15.0 : null,
                            colorFilter: ColorFilter.mode(
                              isFavorite ? Colors.red : AppColors.lightGrey,
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
                bottom: smallerThanLaptop
                    ? 8.0
                    : smallerThanDesktop
                    ? 16.0
                    : 24.0,
                top: isGradientNeeded && isMobile
                    ? 8.0
                    : isGradientNeeded
                    ? 24.0
                    : 16.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  recipe.title,
                  style: textTheme.labelMedium!.copyWith(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.start,
                children: [
                  IntrinsicWidth(
                    child: _buildInfoIconRow(
                      textTheme,
                      Assets.icons.duration,
                      '${recipe.duration} Minutes',
                      isMobile,
                    ),
                  ),
                  IntrinsicWidth(
                    child: _buildInfoIconRow(
                      textTheme,
                      Assets.icons.recipeCategory,
                      recipe.category.title,
                      isMobile,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 32.0,),
          ],
        ),
      ),
    );
  }
}
