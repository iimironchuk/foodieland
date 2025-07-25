// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeVideoPlayerHash() => r'e4ac8441da3b28f3b205949f78cfc2bccd060afa';

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

abstract class _$RecipeVideoPlayer
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String videoUrl;

  FutureOr<void> build(String videoUrl);
}

/// See also [RecipeVideoPlayer].
@ProviderFor(RecipeVideoPlayer)
const recipeVideoPlayerProvider = RecipeVideoPlayerFamily();

/// See also [RecipeVideoPlayer].
class RecipeVideoPlayerFamily extends Family<AsyncValue<void>> {
  /// See also [RecipeVideoPlayer].
  const RecipeVideoPlayerFamily();

  /// See also [RecipeVideoPlayer].
  RecipeVideoPlayerProvider call(String videoUrl) {
    return RecipeVideoPlayerProvider(videoUrl);
  }

  @override
  RecipeVideoPlayerProvider getProviderOverride(
    covariant RecipeVideoPlayerProvider provider,
  ) {
    return call(provider.videoUrl);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeVideoPlayerProvider';
}

/// See also [RecipeVideoPlayer].
class RecipeVideoPlayerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RecipeVideoPlayer, void> {
  /// See also [RecipeVideoPlayer].
  RecipeVideoPlayerProvider(String videoUrl)
    : this._internal(
        () => RecipeVideoPlayer()..videoUrl = videoUrl,
        from: recipeVideoPlayerProvider,
        name: r'recipeVideoPlayerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeVideoPlayerHash,
        dependencies: RecipeVideoPlayerFamily._dependencies,
        allTransitiveDependencies:
            RecipeVideoPlayerFamily._allTransitiveDependencies,
        videoUrl: videoUrl,
      );

  RecipeVideoPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoUrl,
  }) : super.internal();

  final String videoUrl;

  @override
  FutureOr<void> runNotifierBuild(covariant RecipeVideoPlayer notifier) {
    return notifier.build(videoUrl);
  }

  @override
  Override overrideWith(RecipeVideoPlayer Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeVideoPlayerProvider._internal(
        () => create()..videoUrl = videoUrl,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoUrl: videoUrl,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RecipeVideoPlayer, void>
  createElement() {
    return _RecipeVideoPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeVideoPlayerProvider && other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeVideoPlayerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `videoUrl` of this provider.
  String get videoUrl;
}

class _RecipeVideoPlayerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RecipeVideoPlayer, void>
    with RecipeVideoPlayerRef {
  _RecipeVideoPlayerProviderElement(super.provider);

  @override
  String get videoUrl => (origin as RecipeVideoPlayerProvider).videoUrl;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
