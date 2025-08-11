import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/category_model/category_model.dart';
import '../../../../models/recipe_model/recipe_model.dart';
import '../../../../providers/favorites_provider/favorites_provider.dart';
import '../../../../providers/repository_providers.dart';

part 'favorite_recipes_provider.g.dart';

@Riverpod(keepAlive: true)
class RecipeScreenFavorites extends _$RecipeScreenFavorites {
  int _page = 1;
  int _limit = 8;
  bool _isLoadingNext = false;
  bool _hasReachedEnd = false;
  List<RecipeModel> _allRecipes = [];

  @override
  Future<List<RecipeModel>> build(CategoryModel? categoryModel) async {
    final repository = ref.watch(recipeRepositoryProvider);

    _page = 1;

    final recipes = await repository.getFavoritesForOverview(
      page: _page,
      limit: _limit,
      category: categoryModel,
    );

    _allRecipes = recipes;

    _hasReachedEnd = recipes.length < _limit;

    return _allRecipes;
  }

  Future<void> loadMore(CategoryModel? categoryModel) async {
    if (_isLoadingNext || _hasReachedEnd) return;

    _isLoadingNext = true;
    _page++;

    if (_page % 2 == 0) {
      _limit = 7;
    } else {
      _limit = 8;
    }

    final repository = ref.watch(recipeRepositoryProvider);

    final newRecipes = await repository.getFavoritesForOverview(
      page: _page,
      limit: _limit,
      category: categoryModel,
    );

    _allRecipes = [..._allRecipes, ...newRecipes];

    _hasReachedEnd = newRecipes.length < _limit;
    _isLoadingNext = false;

    state = AsyncData(_allRecipes);
  }

  Future<void> toggleFavorite(RecipeModel recipe) async {
    await ref.read(favoriteRecipesProvider.notifier).toggle(recipe);

    final favoriteIds = await ref.read(favoriteRecipesProvider.future);

    final filtered = _allRecipes
        .where((recipe) => favoriteIds.contains(recipe.id.toString()))
        .toList();

    state = AsyncData(filtered);
  }

  bool get hasReachedEnd => _hasReachedEnd;
}
