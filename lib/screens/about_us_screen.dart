import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/recipe_details_provider/recipe_details_provider.dart';
import 'package:foodieland/screens/widgets/three_other_recipe_section.dart';

class AboutUsScreen extends ConsumerWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherRecipesAsync = ref.watch(otherThreeRecipesProvider('ndw32l118dr9idj1arisjm3g'));
    return otherRecipesAsync.when(
      data: (recipes) => ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: ThreeOtherRecipeSection(recipes: recipes, title: 'Other',)),
      error: (error, stack) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
