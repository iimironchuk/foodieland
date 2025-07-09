import 'package:foodieland/models/recipe_model/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._internal();

  Future<SharedPreferences> _prefs() async =>
      await SharedPreferences.getInstance();

  Future<List<String>> getFavoriteRecipes() async {
    final prefs = await _prefs();

    final List<String>? favoriteRecipesIds = prefs.getStringList('favorite_recipes',);

    return favoriteRecipesIds ?? [];
  }

  Future<void> toggleFavoriteRecipe(RecipeModel recipe) async {
    final prefs = await _prefs();

    final favoriteRecipesIds = await getFavoriteRecipes();

    final id = recipe.id.toString();

    if (favoriteRecipesIds.contains(id)) {
      favoriteRecipesIds.remove(id);
    } else {
      favoriteRecipesIds.add(id);
    }

    await prefs.setStringList('favorite_recipes', favoriteRecipesIds);
  }
}