import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../navigation/routes.dart';

class ThreeOtherRecipeSection extends StatelessWidget {
  final List<RecipeModel> recipes;
  final String title;

  const ThreeOtherRecipeSection({
    super.key,
    required this.recipes,
    required this.title,
  });

  void _goToAnotherRecipe(String recipeId, BuildContext context) {
    RecipeDetailRoute(id: recipeId).go(context);
  }

  @override
  Widget build(BuildContext context) {
    final smallerThanDesktop = ResponsiveBreakpoints.of(
      context,
    ).smallerThan(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelMedium!.copyWith(
              fontSize: isMobile
                  ? 18.0
                  : smallerThanDesktop
                  ? 25.0
                  : 32.0,
            ),
          ),
          SizedBox(
            height: isMobile
                ? 12.0
                : smallerThanDesktop
                ? 16.0
                : 20.0,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 6.0 : 12.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _goToAnotherRecipe(recipe.documentId, context),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isMobile ? 150.0 : 180.0,
                          maxHeight: isMobile ? 90.0 : 120.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: recipe.recipeAvatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: isMobile ? 10.0 : 24.0),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? 166.0 : 196.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: isMobile
                                  ? 16.0
                                  : smallerThanDesktop
                                  ? 18.0
                                  : 20.0,
                            ),
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'By ${recipe.authorName}',
                            style: textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: isMobile
                ? 24.0
                : smallerThanDesktop
                ? 48.0
                : 65.0,
          ),
          SizedBox(
              // width: isMobile ? 200.0 : 400,
              // height: isMobile ? 217.0 : null,
              child: Assets.images.advertisment.image(
                width: isMobile ? 200.0 : 400.0,
                height: isMobile ? 217.0 : 434.0,

            ),
          ),
        ],
      ),
    );
  }
}
