import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/screens/recipe_details_screen/recipe_details_providers/recipe_details_provider/recipe_details_provider.dart';
import 'package:foodieland/screens/recipe_details_screen/widgets/other_recipe_section.dart';

class AboutUsScreen extends ConsumerWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherRecipesAsync = ref.watch(otherThreeRecipesProvider);
    return otherRecipesAsync.when(
      data: (recipes) => ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: OtherRecipeSection(recipes: recipes)),
      error: (error, stack) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
