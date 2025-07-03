import 'package:flutter/material.dart';
import 'package:foodieland/models/category_model/category_model.dart';
import 'package:foodieland/repositories/category_repository.dart';

class CategoryRiverpodModel extends ChangeNotifier {
  final CategoryRepository _repository;

  CategoryRiverpodModel(this._repository);

  List<CategoryModel> categories = [];
  bool isLoading = false;

  Future<void> getCategories({int limit = 6}) async {
    isLoading = true;
    notifyListeners();

    categories = await _repository.getCategories(limit);

    isLoading = false;
    notifyListeners();
  }
}
