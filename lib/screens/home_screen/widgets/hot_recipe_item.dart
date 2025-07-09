import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';
import 'package:foodieland/screens/home_screen/widgets/info_with_icon_container.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HotRecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const HotRecipeItem({super.key, required this.recipe});

  Widget _buildAuthorContent(
    TextTheme textTheme,
    bool smallerThanDesktop,
    bool isSmallTablet,
  ) {
    final List<Widget> children = [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: isSmallTablet ? 8.0 : 16.0),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: recipe.authorAvatar,
                fit: BoxFit.cover,
                width: isSmallTablet ? 30.0 : 50.0,
                height: isSmallTablet ? 30.0 : 50.0,
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
                  fontSize: isSmallTablet ? 12.0 : 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                DateFormat('d MMMM yyyy').format(recipe.publishedAt),
                style: textTheme.labelSmall!.copyWith(
                  fontSize: isSmallTablet ? 11.0 : 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      smallerThanDesktop ? SizedBox(height: 20.0) : Spacer(),
      SizedBox(
        height: smallerThanDesktop ? 40.0 : 60.0,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'View Recipe',
            style: textTheme.labelSmall!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: smallerThanDesktop ? 13.0 : 16.0,
              color: AppColors.scaffold,
            ),
          ),
        ),
      ),
    ];

    return smallerThanDesktop
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(children: children);
  }

  Widget _buildInfoContent(TextTheme textTheme, bool smallerThanLaptop) {
    final children = [
      InfoWithIconContainer(
        icon: Assets.icons.duration,
        info: '${recipe.duration} minutes',
      ),
      SizedBox(width: 16.0, height: 10.0),
      InfoWithIconContainer(
        icon: Assets.icons.recipeCategory,
        info: recipe.category.title,
      ),
    ];

    return smallerThanLaptop
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children,
          )
        : Row(children: children);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final smallerThanLaptop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan('Laptop');
    final isSmallLaptop = MediaQuery.of(context).size.width < 1100;
    final isSmallTablet = MediaQuery.of(context).size.width < 600;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Stack(
      children: [
        SizedBox(
          // width: double.infinity,
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
                    padding: EdgeInsets.all(
                      isMobile
                          ? 15.0
                          : isSmallLaptop
                          ? 25.0
                          : 50.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.scaffold,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isSmallTablet ? 10.0 : 20.0,
                              vertical: isSmallTablet ? 5.0 : 10.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.images.hotRecipe.image(
                                  width: isMobile ? 15.0 : 24.0,
                                  height: isMobile ? 15.0 : 24.0,
                                ),
                                SizedBox(width: isSmallTablet ? 8.0 : 13.0),
                                Text(
                                  'Hot Recipes',
                                  style: textTheme.labelMedium!.copyWith(
                                    fontSize: isSmallTablet ? 10 : 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            top: isSmallLaptop ? 20.0 : 32.0,
                            bottom: isSmallLaptop ? 16.0 : 24.0,
                          ),
                          child: Text(
                            recipe.title,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: isMobile
                                  ? 16.0
                                  : smallerThanLaptop
                                  ? 20.0
                                  : isSmallLaptop
                                  ? 30.0
                                  : smallerThanDesktop
                                  ? 40.0
                                  : 60.0,
                            ),
                            maxLines: smallerThanDesktop ? null : 2,
                          ),
                        ),
                        if (!isSmallTablet)
                          Text(
                            recipe.description,
                            style: textTheme.labelSmall!.copyWith(
                              fontSize: smallerThanDesktop ? 13.0 : 16.0,
                            ),
                          ),
                        SizedBox(height: isSmallLaptop ? 10.0 : 30.0),
                        _buildInfoContent(textTheme, smallerThanLaptop),
                        Spacer(),
                        _buildAuthorContent(
                          textTheme,
                          smallerThanDesktop,
                          isSmallTablet,
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

        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: isSmallLaptop ? 25.0 : 50.0),
            child: SizedBox(
              width: isMobile
                  ? 60.0
                  : isSmallLaptop
                  ? 100.0
                  : 150.0,
              height: isMobile
                  ? 60.0
                  : isSmallLaptop
                  ? 100.0
                  : 150.0,
              child: Assets.images.badge.image(),
            ),
          ),
        ),
      ],
    );
  }
}
