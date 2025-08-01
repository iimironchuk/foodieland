// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isRecipeFavoriteHash() => r'613790c905b871b8d14c65141a077f72457fdab0';

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

/// See also [isRecipeFavorite].
@ProviderFor(isRecipeFavorite)
const isRecipeFavoriteProvider = IsRecipeFavoriteFamily();

/// See also [isRecipeFavorite].
class IsRecipeFavoriteFamily extends Family<bool> {
  /// See also [isRecipeFavorite].
  const IsRecipeFavoriteFamily();

  /// See also [isRecipeFavorite].
  IsRecipeFavoriteProvider call(String recipeId) {
    return IsRecipeFavoriteProvider(recipeId);
  }

  @override
  IsRecipeFavoriteProvider getProviderOverride(
    covariant IsRecipeFavoriteProvider provider,
  ) {
    return call(provider.recipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isRecipeFavoriteProvider';
}

/// See also [isRecipeFavorite].
class IsRecipeFavoriteProvider extends AutoDisposeProvider<bool> {
  /// See also [isRecipeFavorite].
  IsRecipeFavoriteProvider(String recipeId)
    : this._internal(
        (ref) => isRecipeFavorite(ref as IsRecipeFavoriteRef, recipeId),
        from: isRecipeFavoriteProvider,
        name: r'isRecipeFavoriteProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isRecipeFavoriteHash,
        dependencies: IsRecipeFavoriteFamily._dependencies,
        allTransitiveDependencies:
            IsRecipeFavoriteFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  IsRecipeFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final String recipeId;

  @override
  Override overrideWith(bool Function(IsRecipeFavoriteRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: IsRecipeFavoriteProvider._internal(
        (ref) => create(ref as IsRecipeFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsRecipeFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsRecipeFavoriteProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsRecipeFavoriteRef on AutoDisposeProviderRef<bool> {
  /// The parameter `recipeId` of this provider.
  String get recipeId;
}

class _IsRecipeFavoriteProviderElement extends AutoDisposeProviderElement<bool>
    with IsRecipeFavoriteRef {
  _IsRecipeFavoriteProviderElement(super.provider);

  @override
  String get recipeId => (origin as IsRecipeFavoriteProvider).recipeId;
}

String _$favoriteRecipesHash() => r'40fcb8aca84c3df8d65c7f8267ecd2a8d4564ebd';

/// See also [FavoriteRecipes].
@ProviderFor(FavoriteRecipes)
final favoriteRecipesProvider =
    AsyncNotifierProvider<FavoriteRecipes, Set<String>>.internal(
      FavoriteRecipes.new,
      name: r'favoriteRecipesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteRecipesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteRecipes = AsyncNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
