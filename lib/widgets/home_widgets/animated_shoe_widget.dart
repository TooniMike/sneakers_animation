import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/recipe_repository.dart';
import 'loaded_shoe_widget.dart';


class AnimatedShoeWidget extends ConsumerWidget {
  const AnimatedShoeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final recipes = ref.watch(shoeProvider);
    return recipes.when(
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      data: (recipes) => LoadedShoeWidget(
        shoe: recipes,
      ),
    );
  }
}
