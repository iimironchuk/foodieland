// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_recipes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeScreenFavoritesHash() =>
    r'd822f95b3909da3f8c6c8fc104c8cb281402541d';

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

abstract class _$RecipeScreenFavorites
    extends BuildlessAsyncNotifier<List<RecipeModel>> {
  late final CategoryModel? categoryModel;

  FutureOr<List<RecipeModel>> build(CategoryModel? categoryModel);
}

/// See also [RecipeScreenFavorites].
@ProviderFor(RecipeScreenFavorites)
const recipeScreenFavoritesProvider = RecipeScreenFavoritesFamily();

/// See also [RecipeScreenFavorites].
class RecipeScreenFavoritesFamily
    extends Family<AsyncValue<List<RecipeModel>>> {
  /// See also [RecipeScreenFavorites].
  const RecipeScreenFavoritesFamily();

  /// See also [RecipeScreenFavorites].
  RecipeScreenFavoritesProvider call(CategoryModel? categoryModel) {
    return RecipeScreenFavoritesProvider(categoryModel);
  }

  @override
  RecipeScreenFavoritesProvider getProviderOverride(
    covariant RecipeScreenFavoritesProvider provider,
  ) {
    return call(provider.categoryModel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeScreenFavoritesProvider';
}

/// See also [RecipeScreenFavorites].
class RecipeScreenFavoritesProvider
    extends
        AsyncNotifierProviderImpl<RecipeScreenFavorites, List<RecipeModel>> {
  /// See also [RecipeScreenFavorites].
  RecipeScreenFavoritesProvider(CategoryModel? categoryModel)
    : this._internal(
        () => RecipeScreenFavorites()..categoryModel = categoryModel,
        from: recipeScreenFavoritesProvider,
        name: r'recipeScreenFavoritesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeScreenFavoritesHash,
        dependencies: RecipeScreenFavoritesFamily._dependencies,
        allTransitiveDependencies:
            RecipeScreenFavoritesFamily._allTransitiveDependencies,
        categoryModel: categoryModel,
      );

  RecipeScreenFavoritesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryModel,
  }) : super.internal();

  final CategoryModel? categoryModel;

  @override
  FutureOr<List<RecipeModel>> runNotifierBuild(
    covariant RecipeScreenFavorites notifier,
  ) {
    return notifier.build(categoryModel);
  }

  @override
  Override overrideWith(RecipeScreenFavorites Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeScreenFavoritesProvider._internal(
        () => create()..categoryModel = categoryModel,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryModel: categoryModel,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<RecipeScreenFavorites, List<RecipeModel>>
  createElement() {
    return _RecipeScreenFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeScreenFavoritesProvider &&
        other.categoryModel == categoryModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeScreenFavoritesRef on AsyncNotifierProviderRef<List<RecipeModel>> {
  /// The parameter `categoryModel` of this provider.
  CategoryModel? get categoryModel;
}

class _RecipeScreenFavoritesProviderElement
    extends
        AsyncNotifierProviderElement<RecipeScreenFavorites, List<RecipeModel>>
    with RecipeScreenFavoritesRef {
  _RecipeScreenFavoritesProviderElement(super.provider);

  @override
  CategoryModel? get categoryModel =>
      (origin as RecipeScreenFavoritesProvider).categoryModel;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
