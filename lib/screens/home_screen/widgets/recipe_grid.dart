import 'package:flutter/material.dart';
import 'package:foodieland/gen/assets.gen.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/screens/home_screen/widgets/recipe_item.dart';

class RecipeGrid extends StatelessWidget {
  final List<RecipeModel> recipeList;

  const RecipeGrid({super.key, required this.recipeList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipeList.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 40.0,
        crossAxisSpacing: 40.0,
        childAspectRatio: 400 / 434,
      ),
      itemBuilder: (context, index) {
        if(index == 5){
          return Assets.images.advertisment.image();
        }

        final adjustedIndex = index > 5 ? index - 1 : index;
        return RecipeItem(recipe: recipeList[adjustedIndex]);
      },
    );
  }
}
