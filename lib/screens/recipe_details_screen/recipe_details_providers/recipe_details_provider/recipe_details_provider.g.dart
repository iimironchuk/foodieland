// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeWithDetailsHash() => r'3a6756c91cee3c34137d7cda0efd046242903400';

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

/// See also [recipeWithDetails].
@ProviderFor(recipeWithDetails)
const recipeWithDetailsProvider = RecipeWithDetailsFamily();

/// See also [recipeWithDetails].
class RecipeWithDetailsFamily extends Family<AsyncValue<RecipeModel>> {
  /// See also [recipeWithDetails].
  const RecipeWithDetailsFamily();

  /// See also [recipeWithDetails].
  RecipeWithDetailsProvider call(String documentId) {
    return RecipeWithDetailsProvider(documentId);
  }

  @override
  RecipeWithDetailsProvider getProviderOverride(
    covariant RecipeWithDetailsProvider provider,
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
  String? get name => r'recipeWithDetailsProvider';
}

/// See also [recipeWithDetails].
class RecipeWithDetailsProvider extends AutoDisposeFutureProvider<RecipeModel> {
  /// See also [recipeWithDetails].
  RecipeWithDetailsProvider(String documentId)
    : this._internal(
        (ref) => recipeWithDetails(ref as RecipeWithDetailsRef, documentId),
        from: recipeWithDetailsProvider,
        name: r'recipeWithDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recipeWithDetailsHash,
        dependencies: RecipeWithDetailsFamily._dependencies,
        allTransitiveDependencies:
            RecipeWithDetailsFamily._allTransitiveDependencies,
        documentId: documentId,
      );

  RecipeWithDetailsProvider._internal(
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
    FutureOr<RecipeModel> Function(RecipeWithDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeWithDetailsProvider._internal(
        (ref) => create(ref as RecipeWithDetailsRef),
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
  AutoDisposeFutureProviderElement<RecipeModel> createElement() {
    return _RecipeWithDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeWithDetailsProvider && other.documentId == documentId;
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
mixin RecipeWithDetailsRef on AutoDisposeFutureProviderRef<RecipeModel> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _RecipeWithDetailsProviderElement
    extends AutoDisposeFutureProviderElement<RecipeModel>
    with RecipeWithDetailsRef {
  _RecipeWithDetailsProviderElement(super.provider);

  @override
  String get documentId => (origin as RecipeWithDetailsProvider).documentId;
}

String _$otherThreeRecipesHash() => r'c44ef6830807c9a9b2305f494fe4b9fab213887d';

/// See also [otherThreeRecipes].
@ProviderFor(otherThreeRecipes)
const otherThreeRecipesProvider = OtherThreeRecipesFamily();

/// See also [otherThreeRecipes].
class OtherThreeRecipesFamily extends Family<AsyncValue<List<RecipeModel>>> {
  /// See also [otherThreeRecipes].
  const OtherThreeRecipesFamily();

  /// See also [otherThreeRecipes].
  OtherThreeRecipesProvider call(String currentRecipeId) {
    return OtherThreeRecipesProvider(currentRecipeId);
  }

  @override
  OtherThreeRecipesProvider getProviderOverride(
    covariant OtherThreeRecipesProvider provider,
  ) {
    return call(provider.currentRecipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otherThreeRecipesProvider';
}

/// See also [otherThreeRecipes].
class OtherThreeRecipesProvider
    extends AutoDisposeFutureProvider<List<RecipeModel>> {
  /// See also [otherThreeRecipes].
  OtherThreeRecipesProvider(String currentRecipeId)
    : this._internal(
        (ref) =>
            otherThreeRecipes(ref as OtherThreeRecipesRef, currentRecipeId),
        from: otherThreeRecipesProvider,
        name: r'otherThreeRecipesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$otherThreeRecipesHash,
        dependencies: OtherThreeRecipesFamily._dependencies,
        allTransitiveDependencies:
            OtherThreeRecipesFamily._allTransitiveDependencies,
        currentRecipeId: currentRecipeId,
      );

  OtherThreeRecipesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentRecipeId,
  }) : super.internal();

  final String currentRecipeId;

  @override
  Override overrideWith(
    FutureOr<List<RecipeModel>> Function(OtherThreeRecipesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OtherThreeRecipesProvider._internal(
        (ref) => create(ref as OtherThreeRecipesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentRecipeId: currentRecipeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RecipeModel>> createElement() {
    return _OtherThreeRecipesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherThreeRecipesProvider &&
        other.currentRecipeId == currentRecipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentRecipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OtherThreeRecipesRef on AutoDisposeFutureProviderRef<List<RecipeModel>> {
  /// The parameter `currentRecipeId` of this provider.
  String get currentRecipeId;
}

class _OtherThreeRecipesProviderElement
    extends AutoDisposeFutureProviderElement<List<RecipeModel>>
    with OtherThreeRecipesRef {
  _OtherThreeRecipesProviderElement(super.provider);

  @override
  String get currentRecipeId =>
      (origin as OtherThreeRecipesProvider).currentRecipeId;
}

String _$otherRecipesByCategoryHash() =>
    r'ec7b9a1a1857f303877278d9b0c1de3af9a03bd0';

/// See also [otherRecipesByCategory].
@ProviderFor(otherRecipesByCategory)
const otherRecipesByCategoryProvider = OtherRecipesByCategoryFamily();

/// See also [otherRecipesByCategory].
class OtherRecipesByCategoryFamily
    extends Family<AsyncValue<List<RecipeModel>>> {
  /// See also [otherRecipesByCategory].
  const OtherRecipesByCategoryFamily();

  /// See also [otherRecipesByCategory].
  OtherRecipesByCategoryProvider call(String category) {
    return OtherRecipesByCategoryProvider(category);
  }

  @override
  OtherRecipesByCategoryProvider getProviderOverride(
    covariant OtherRecipesByCategoryProvider provider,
  ) {
    return call(provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otherRecipesByCategoryProvider';
}

/// See also [otherRecipesByCategory].
class OtherRecipesByCategoryProvider
    extends AutoDisposeFutureProvider<List<RecipeModel>> {
  /// See also [otherRecipesByCategory].
  OtherRecipesByCategoryProvider(String category)
    : this._internal(
        (ref) =>
            otherRecipesByCategory(ref as OtherRecipesByCategoryRef, category),
        from: otherRecipesByCategoryProvider,
        name: r'otherRecipesByCategoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$otherRecipesByCategoryHash,
        dependencies: OtherRecipesByCategoryFamily._dependencies,
        allTransitiveDependencies:
            OtherRecipesByCategoryFamily._allTransitiveDependencies,
        category: category,
      );

  OtherRecipesByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<RecipeModel>> Function(OtherRecipesByCategoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OtherRecipesByCategoryProvider._internal(
        (ref) => create(ref as OtherRecipesByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RecipeModel>> createElement() {
    return _OtherRecipesByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherRecipesByCategoryProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OtherRecipesByCategoryRef
    on AutoDisposeFutureProviderRef<List<RecipeModel>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _OtherRecipesByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<RecipeModel>>
    with OtherRecipesByCategoryRef {
  _OtherRecipesByCategoryProviderElement(super.provider);

  @override
  String get category => (origin as OtherRecipesByCategoryProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
