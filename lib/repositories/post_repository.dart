import 'package:dio/dio.dart';
import 'package:foodieland/services/api_service.dart';
import 'package:foodieland/utils/extensions.dart';

import '../models/post_model/post_model.dart';

class PostRepository {
  static final PostRepository _instance = PostRepository._internal();

  factory PostRepository() => _instance;

  PostRepository._internal();

  final Dio _dio = ApiService().dio;

  Future<List<PostModel>> getPostsForOverview({
    required int pageSize,
    required int page,
  }) async {
    try {
      final response = await _dio.get(
        'posts',
        queryParameters: {
          'populate': {'authorAvatar': true, 'postAvatar': true},
          'pagination[pageSize]': pageSize,
          'pagination[page]': page,
        },
      );

      if (response.isSuccess) {
        return (response.data['data'] as List)
            .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> getPostCount() async {
    final response = await _dio.get(
      'posts',
      queryParameters: {'pagination[pageSize]': 6, 'pagination[page]': 1},
    );

    if (response.isSuccess) {
      return response.data['meta']['pagination']['total'];
    } else {
      return 0;
    }
  }
}
