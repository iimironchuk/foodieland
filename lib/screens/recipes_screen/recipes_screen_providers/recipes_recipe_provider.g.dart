// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipesScreenRecipeListHash() =>
    r'd5950aadc7b0386c1c6c437f51788c6866205ba8';

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

abstract class _$RecipesScreenRecipeList
    extends BuildlessAutoDisposeAsyncNotifier<List<RecipeModel>> {
  late final CategoryModel? categoryModel;

  FutureOr<List<RecipeModel>> build(CategoryModel? categoryModel);
}

/// See also [RecipesScreenRecipeList].
@ProviderFor(RecipesScreenRecipeList)
const recipesScreenRecipeListProvider = RecipesScreenRecipeListFamily();

/// See also [RecipesScreenRecipeList].
class RecipesScreenRecipeListFamily
    extends Family<AsyncValue<List<RecipeModel>>> {
  /// See also [RecipesScreenRecipeList].
  const RecipesScreenRecipeListFamily();

  /// See also [RecipesScreenRecipeList].
  RecipesScreenRecipeListProvider call(CategoryModel? categoryModel) {
    return RecipesScreenRecipeListProvider(categoryModel);
  }

  @override
  RecipesScreenRecipeListProvider getProviderOverride(
    covariant RecipesScreenRecipeListProvider provider,
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
  String? get name => r'recipesScreenRecipeListProvider';
}

/// See also [RecipesScreenRecipeList].
class RecipesScreenRecipeListProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          RecipesScreenRecipeList,
          List<RecipeModel>
        > {
  /// See also [RecipesScreenRecipeList].
  RecipesScreenRecipeListProvider(CategoryModel? categoryModel)
    : this._internal(
        () => RecipesScreenRecipeList()..categoryModel = categoryModel,
        from: recipesScreenRecipeListProvider,
        name: r'recipesScreenRecipeListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipesScreenRecipeListHash,
        dependencies: RecipesScreenRecipeListFamily._dependencies,
        allTransitiveDependencies:
            RecipesScreenRecipeListFamily._allTransitiveDependencies,
        categoryModel: categoryModel,
      );

  RecipesScreenRecipeListProvider._internal(
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
    covariant RecipesScreenRecipeList notifier,
  ) {
    return notifier.build(categoryModel);
  }

  @override
  Override overrideWith(RecipesScreenRecipeList Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipesScreenRecipeListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
    RecipesScreenRecipeList,
    List<RecipeModel>
  >
  createElement() {
    return _RecipesScreenRecipeListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipesScreenRecipeListProvider &&
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
mixin RecipesScreenRecipeListRef
    on AutoDisposeAsyncNotifierProviderRef<List<RecipeModel>> {
  /// The parameter `categoryModel` of this provider.
  CategoryModel? get categoryModel;
}

class _RecipesScreenRecipeListProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          RecipesScreenRecipeList,
          List<RecipeModel>
        >
    with RecipesScreenRecipeListRef {
  _RecipesScreenRecipeListProviderElement(super.provider);

  @override
  CategoryModel? get categoryModel =>
      (origin as RecipesScreenRecipeListProvider).categoryModel;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
