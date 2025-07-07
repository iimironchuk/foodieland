import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/repositories/subscription_repository.dart';

import '../repositories/category_repository.dart';
import '../repositories/recipe_repository.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepository();
});

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepository();
});
