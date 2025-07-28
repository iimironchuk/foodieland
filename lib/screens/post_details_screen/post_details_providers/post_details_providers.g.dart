// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postWithDetailsHash() => r'ea6f1d5ad0640bf59f2fc404d1b1f715a563f35e';

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

/// See also [postWithDetails].
@ProviderFor(postWithDetails)
const postWithDetailsProvider = PostWithDetailsFamily();

/// See also [postWithDetails].
class PostWithDetailsFamily extends Family<AsyncValue<PostModel>> {
  /// See also [postWithDetails].
  const PostWithDetailsFamily();

  /// See also [postWithDetails].
  PostWithDetailsProvider call(String documentId) {
    return PostWithDetailsProvider(documentId);
  }

  @override
  PostWithDetailsProvider getProviderOverride(
    covariant PostWithDetailsProvider provider,
  ) {
    return call(provider.documentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postWithDetailsProvider';
}

/// See also [postWithDetails].
class PostWithDetailsProvider extends AutoDisposeFutureProvider<PostModel> {
  /// See also [postWithDetails].
  PostWithDetailsProvider(String documentId)
    : this._internal(
        (ref) => postWithDetails(ref as PostWithDetailsRef, documentId),
        from: postWithDetailsProvider,
        name: r'postWithDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$postWithDetailsHash,
        dependencies: PostWithDetailsFamily._dependencies,
        allTransitiveDependencies:
            PostWithDetailsFamily._allTransitiveDependencies,
        documentId: documentId,
      );

  PostWithDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
  }) : super.internal();

  final String documentId;

  @override
  Override overrideWith(
    FutureOr<PostModel> Function(PostWithDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostWithDetailsProvider._internal(
        (ref) => create(ref as PostWithDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentId: documentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PostModel> createElement() {
    return _PostWithDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostWithDetailsProvider && other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostWithDetailsRef on AutoDisposeFutureProviderRef<PostModel> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _PostWithDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PostModel>
    with PostWithDetailsRef {
  _PostWithDetailsProviderElement(super.provider);

  @override
  String get documentId => (origin as PostWithDetailsProvider).documentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
