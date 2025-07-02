import 'package:flutter/cupertino.dart';
import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:foodieland/repositories/recipe_repository.dart';

class RecipeRiverpodModel extends ChangeNotifier {
  final RecipeRepository _repository;

  RecipeRiverpodModel(this._repository);

  List<RecipeModel> hotRecipes = [];
  bool isLoading = false;

  Future<void> getRecipesForOverview() async {
    isLoading = true;
    notifyListeners();

    hotRecipes = await _repository.getRecipesForOverview();

    isLoading = false;
    notifyListeners();
  }
}