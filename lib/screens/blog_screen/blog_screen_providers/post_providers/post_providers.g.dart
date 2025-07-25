// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalPostCountHash() => r'8ec8fa39b300c07f9ae6654c9dfce4b1ba3c5067';

/// See also [totalPostCount].
@ProviderFor(totalPostCount)
final totalPostCountProvider = AutoDisposeFutureProvider<int>.internal(
  totalPostCount,
  name: r'totalPostCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalPostCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalPostCountRef = AutoDisposeFutureProviderRef<int>;
String _$postOverviewHash() => r'753aca5c7319c581e550c13cb2dc4fbdb8c6cc05';

/// See also [PostOverview].
@ProviderFor(PostOverview)
final postOverviewProvider =
    AutoDisposeAsyncNotifierProvider<PostOverview, List<PostModel>>.internal(
      PostOverview.new,
      name: r'postOverviewProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$postOverviewHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PostOverview = AutoDisposeAsyncNotifier<List<PostModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
