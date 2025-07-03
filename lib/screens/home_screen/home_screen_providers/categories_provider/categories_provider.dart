import 'package:foodieland/models/category_model/category_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: false)
class CategoryList extends _$CategoryList {
  @override
  Future<List<CategoryModel>> build() async {
    final repository = ref.watch(categoryRepositoryProvider);
    return await repository.getCategories(6);
  }

  Future<void> loadAllCategories() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.watch(categoryRepositoryProvider);
      return await repository.getCategories( 100);
    });
  }
}