import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/post_model/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../providers/repository_providers.dart';

part 'post_providers.g.dart';

@Riverpod(keepAlive: false)
class PostOverview extends _$PostOverview {
  int _pageSize = 6;
  int _page = 1;
  List<PostModel> _posts = [];

  @override
  Future<List<PostModel>> build(String? searchedText) async {
    final repository = ref.watch(postRepositoryProvider);

    _posts = await repository.getPostsForOverview(
      pageSize: _pageSize,
      page: _page,
      searchText: searchedText,
    );

    return _posts;
  }

  Future<void> getPostsOnSelectedPage({required int selectedPage, String? searchedText}) async {
    final repository = ref.watch(postRepositoryProvider);

    _posts = await repository.getPostsForOverview(
      pageSize: _pageSize,
      page: selectedPage,
      searchText: searchedText
    );

    state = AsyncData(_posts);
  }

  // Future<List<PostModel>> getSearchedPosts

}

@riverpod
Future<int> totalPostCount(Ref ref, String? searchedText) async {
  final repository = ref.watch(postRepositoryProvider);

  final postCount = repository.getPostCount(searchedText);

  return postCount;
}
