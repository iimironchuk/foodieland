// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_recipes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hotRecipesListHash() => r'ca3ef95d3bc872ad9925279e3473ddd58ef3cb0f';

/// See also [hotRecipesList].
@ProviderFor(hotRecipesList)
final hotRecipesListProvider =
    AutoDisposeFutureProvider<List<RecipeModel>>.internal(
      hotRecipesList,
      name: r'hotRecipesListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$hotRecipesListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HotRecipesListRef = AutoDisposeFutureProviderRef<List<RecipeModel>>;
String _$recipeListHash() => r'eccbe440508e9b5ae56d080507699ab4740a27f4';

/// See also [RecipeList].
@ProviderFor(RecipeList)
final recipeListProvider =
    AutoDisposeAsyncNotifierProvider<RecipeList, List<RecipeModel>>.internal(
      RecipeList.new,
      name: r'recipeListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recipeListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RecipeList = AutoDisposeAsyncNotifier<List<RecipeModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
