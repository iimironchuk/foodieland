import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/recipe_model/recipe_model.dart';

part 'recipe_details_provider.g.dart';

@riverpod
Future<RecipeModel> recipeWithDetails(Ref ref, String documentId) async {
  final repository = ref.read(recipeRepositoryProvider);
  final recipeModel = await repository.getRecipeWithDetails(
    documentId: documentId,
  );
  return recipeModel;
}
