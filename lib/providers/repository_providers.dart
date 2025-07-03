import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/category_repository.dart';
import '../repositories/recipe_repository.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepository();
});