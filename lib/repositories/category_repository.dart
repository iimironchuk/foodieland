import 'package:dio/dio.dart';
import 'package:foodieland/models/category_model/category_model.dart';
import 'package:foodieland/utils/extensions.dart';

import '../services/api_service.dart';

class CategoryRepository {
  static final CategoryRepository _instance = CategoryRepository._internal();

  factory CategoryRepository() => _instance;

  final Dio _dio = ApiService().dio;

  CategoryRepository._internal();

  Future<List<CategoryModel>> getCategories({required int limit, required int page}) async {
    final response = await _dio.get(
      'categories',
      queryParameters: {
        'populate': '*',
        'pagination[pageSize]': limit,
        'pagination[page]': page,
      },
    );

    if (response.isSuccess) {
      return (response.data['data'] as List)
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
