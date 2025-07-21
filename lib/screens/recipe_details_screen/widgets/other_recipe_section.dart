import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';

class OtherRecipeSection extends StatelessWidget {
  final List<RecipeModel> recipes;

  const OtherRecipeSection({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'Other Recipe',
          style: textTheme.labelMedium!.copyWith(fontSize: 32.0),
        ),
        SizedBox(height: 32.0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 180 / 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(imageUrl: recipe.recipeAvatar),
                    ),
                  ),
                  SizedBox(width: 24.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.title,
                          style: textTheme.labelMedium!.copyWith(fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
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

        SizedBox(height: 80.0),
        AspectRatio(
          aspectRatio: 400 / 434,
          child: Assets.images.advertisment.image(),
        ),
      ],
    );
  }
}
