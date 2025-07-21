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
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Other Recipe',
            style: textTheme.labelMedium!.copyWith(fontSize: 32.0),
          ),
          SizedBox(height: 20.0),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 180.0,
                        maxHeight: 120.0,
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
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 196.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            style: textTheme.labelMedium!.copyWith(
                              fontSize: 20.0,
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
          SizedBox(height: 65.0),
          AspectRatio(
            aspectRatio: 400 / 434,
            child: Assets.images.advertisment.image(),
          ),
        ],
      ),
    );
  }
}
