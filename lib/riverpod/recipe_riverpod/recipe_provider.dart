import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/repositories/recipe_repository.dart';
import 'package:foodieland/riverpod/recipe_riverpod/recipe_riverpod_model.dart';

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepository();
});

final recipeRiverpodProvider =
ChangeNotifierProvider<RecipeRiverpodModel>((ref) {
  final repository = ref.read(recipeRepositoryProvider);
  return RecipeRiverpodModel(repository);
});