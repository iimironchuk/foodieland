import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/resources/app_colors.dart';

class HotRecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const HotRecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
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
                  child: CachedNetworkImage(imageUrl: recipe.recipeAvatar),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
