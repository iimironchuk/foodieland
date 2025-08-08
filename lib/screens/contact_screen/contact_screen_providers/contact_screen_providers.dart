import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_screen_providers.g.dart';

@riverpod
Future<void> createContact(Ref ref) async {
  final repository = ref.read(contactRepositoryProvider);

  await repository.createContact(
    name: ref.watch(contactNameProvider),
    email: ref.watch(contactEmailProvider),
    subject: ref.watch(contactSubjectProvider),
    enquiry: ref.watch(contactEnquiryProvider),
    message: ref.watch(contactMessageProvider),
  );
}

final contactNameProvider = StateProvider<String>((ref) => '');
final contactEmailProvider = StateProvider<String>((ref) => '');
final contactSubjectProvider = StateProvider<String>((ref) => '');
final contactEnquiryProvider = StateProvider<String>((ref) => 'Advertising');
final contactMessageProvider = StateProvider<String>((ref) => '');
