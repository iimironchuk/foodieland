import 'package:foodieland/models/category_model/category_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: false)
class CategoryList extends _$CategoryList {
  int _page = 1;
  int _limit = 6;
  bool _isLoadingNext = false;
  bool _hasReachedEnd = false;
  List<CategoryModel> _categories = [];
  @override
  Future<List<CategoryModel>> build() async {
    final repository = ref.watch(categoryRepositoryProvider);
    final categoriesFromServer = await repository.getCategories(limit: _limit, page: _page);

    _categories = categoriesFromServer;
    _hasReachedEnd = _categories.length < _limit;
    return _categories;
  }

  Future<void> loadAllCategories() async {
    if (_hasReachedEnd || _isLoadingNext) return;

    _isLoadingNext = true;

    final repository = ref.read(categoryRepositoryProvider);
    final List<CategoryModel> allNew = [];

    while (true) {
      final nextPage = _page + 1;
      final newBatch = await repository.getCategories(limit: _limit, page: nextPage);

      if (newBatch.isEmpty) break;

      allNew.addAll(newBatch);
      _page = nextPage;

      if (newBatch.length < _limit) {
        _hasReachedEnd = true;
        break;
      }
    }

    _categories = [..._categories, ...allNew];
    _isLoadingNext = false;

    state = AsyncData(_categories);
  }
}