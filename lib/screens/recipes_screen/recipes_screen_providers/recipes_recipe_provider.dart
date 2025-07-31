import 'package:foodieland/models/category_model/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/recipe_model/recipe_model.dart';
import '../../../providers/favorites_provider/favorites_provider.dart';
import '../../../providers/repository_providers.dart';
import '../../../providers/services_providers.dart';

part 'recipes_recipe_provider.g.dart';

@Riverpod(keepAlive: false)
class RecipesScreenRecipeList extends _$RecipesScreenRecipeList {
  int _page = 1;
  int _limit = 8;
  bool _isLoadingNext = false;
  bool _hasReachedEnd = false;
  List<RecipeModel> _recipes = [];

  @override
  Future<List<RecipeModel>> build(CategoryModel? categoryModel) async {
    final repository = ref.watch(recipeRepositoryProvider);
    final recipesFromServer = await repository.getRecipesForOverview(
      page: _page,
      limit: _limit,
      category: categoryModel,
    );

    _recipes = recipesFromServer;

    _hasReachedEnd = _recipes.length < _limit;

    return _recipes;
  }

  Future<void> loadMore(CategoryModel? categoryModel) async {
    if (_isLoadingNext || _hasReachedEnd) return;

    _isLoadingNext = true;
    _page++;
    _limit = 9;
    final repository = ref.watch(recipeRepositoryProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final recipesFromServer = await repository.getRecipesForOverview(
      page: _page,
      limit: _limit,
      category: categoryModel,
    );

    final List<String> favoriteIds = await sharedPreferences
        .getFavoriteRecipes();

    _recipes = [..._recipes, ...recipesFromServer];

    _recipes = _recipes.map((recipe) {
      return recipe.copyWith(
        isFavorite: favoriteIds.contains(recipe.id.toString()),
      );
    }).toList();

    _hasReachedEnd = recipesFromServer.length < _limit;
    _isLoadingNext = false;

    state = AsyncData(_recipes);
  }

  Future<void> toggleFavorite(RecipeModel recipe) async {
    await ref.read(favoriteRecipesProvider.notifier).toggle(recipe);
    state = AsyncData(_recipes);
  }

  bool get hasReachedEnd => _hasReachedEnd;
}
