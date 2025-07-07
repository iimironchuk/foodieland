import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_provider.g.dart';

@riverpod
Future<void> subscribe(Ref ref, String email) async {
  final repository = ref.read(subscriptionRepositoryProvider);

  await repository.createSubscription(email: email);
}