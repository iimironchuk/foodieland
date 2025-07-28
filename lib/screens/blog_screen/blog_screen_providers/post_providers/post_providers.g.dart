// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalPostCountHash() => r'bb69f1f65923bd24de4b238450068ed94d3f4814';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [totalPostCount].
@ProviderFor(totalPostCount)
const totalPostCountProvider = TotalPostCountFamily();

/// See also [totalPostCount].
class TotalPostCountFamily extends Family<AsyncValue<int>> {
  /// See also [totalPostCount].
  const TotalPostCountFamily();

  /// See also [totalPostCount].
  TotalPostCountProvider call(String? searchedText) {
    return TotalPostCountProvider(searchedText);
  }

  @override
  TotalPostCountProvider getProviderOverride(
    covariant TotalPostCountProvider provider,
  ) {
    return call(provider.searchedText);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'totalPostCountProvider';
}

/// See also [totalPostCount].
class TotalPostCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [totalPostCount].
  TotalPostCountProvider(String? searchedText)
    : this._internal(
        (ref) => totalPostCount(ref as TotalPostCountRef, searchedText),
        from: totalPostCountProvider,
        name: r'totalPostCountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$totalPostCountHash,
        dependencies: TotalPostCountFamily._dependencies,
        allTransitiveDependencies:
            TotalPostCountFamily._allTransitiveDependencies,
        searchedText: searchedText,
      );

  TotalPostCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchedText,
  }) : super.internal();

  final String? searchedText;

  @override
  Override overrideWith(
    FutureOr<int> Function(TotalPostCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TotalPostCountProvider._internal(
        (ref) => create(ref as TotalPostCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchedText: searchedText,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _TotalPostCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TotalPostCountProvider &&
        other.searchedText == searchedText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchedText.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TotalPostCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `searchedText` of this provider.
  String? get searchedText;
}

class _TotalPostCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with TotalPostCountRef {
  _TotalPostCountProviderElement(super.provider);

  @override
  String? get searchedText => (origin as TotalPostCountProvider).searchedText;
}

String _$postOverviewHash() => r'fbc373262abf8fbf7eed81d2ef24a7eadd3750e3';

abstract class _$PostOverview
    extends BuildlessAutoDisposeAsyncNotifier<List<PostModel>> {
  late final String? searchedText;

  FutureOr<List<PostModel>> build(String? searchedText);
}

/// See also [PostOverview].
@ProviderFor(PostOverview)
const postOverviewProvider = PostOverviewFamily();

/// See also [PostOverview].
class PostOverviewFamily extends Family<AsyncValue<List<PostModel>>> {
  /// See also [PostOverview].
  const PostOverviewFamily();

  /// See also [PostOverview].
  PostOverviewProvider call(String? searchedText) {
    return PostOverviewProvider(searchedText);
  }

  @override
  PostOverviewProvider getProviderOverride(
    covariant PostOverviewProvider provider,
  ) {
    return call(provider.searchedText);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postOverviewProvider';
}

/// See also [PostOverview].
class PostOverviewProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<PostOverview, List<PostModel>> {
  /// See also [PostOverview].
  PostOverviewProvider(String? searchedText)
    : this._internal(
        () => PostOverview()..searchedText = searchedText,
        from: postOverviewProvider,
        name: r'postOverviewProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$postOverviewHash,
        dependencies: PostOverviewFamily._dependencies,
        allTransitiveDependencies:
            PostOverviewFamily._allTransitiveDependencies,
        searchedText: searchedText,
      );

  PostOverviewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchedText,
  }) : super.internal();

  final String? searchedText;

  @override
  FutureOr<List<PostModel>> runNotifierBuild(covariant PostOverview notifier) {
    return notifier.build(searchedText);
  }

  @override
  Override overrideWith(PostOverview Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostOverviewProvider._internal(
        () => create()..searchedText = searchedText,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchedText: searchedText,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PostOverview, List<PostModel>>
  createElement() {
    return _PostOverviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostOverviewProvider && other.searchedText == searchedText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchedText.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostOverviewRef on AutoDisposeAsyncNotifierProviderRef<List<PostModel>> {
  /// The parameter `searchedText` of this provider.
  String? get searchedText;
}

class _PostOverviewProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<PostOverview, List<PostModel>>
    with PostOverviewRef {
  _PostOverviewProviderElement(super.provider);

  @override
  String? get searchedText => (origin as PostOverviewProvider).searchedText;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
