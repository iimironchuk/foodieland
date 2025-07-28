import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/post_model/post_model.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_details_providers.g.dart';

@riverpod
Future<PostModel> postWithDetails(Ref ref, String documentId) async {
  final repository = ref.watch(postRepositoryProvider);

  final postModel = repository.getPostDetailsById(documentId: documentId);
  return postModel;
}