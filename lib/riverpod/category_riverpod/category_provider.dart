import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/category_repository.dart';
import 'category_riverpod_model.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

final categoryRiverpodProvider =
ChangeNotifierProvider<CategoryRiverpodModel>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return CategoryRiverpodModel(repository);
});