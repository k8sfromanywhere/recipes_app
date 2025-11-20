import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/presentation/details/cubit/recipe_details_cubit.dart';
import 'package:recipes_app/presentation/details/cubit/recipe_details_state.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final String id;

  const RecipeDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeDetailsCubit(context.read())..load(id),
      child: Scaffold(
        appBar: AppBar(title: const Text("Рецепт")),
        body: BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
          builder: (context, state) {
            return switch (state) {
              RecipeDetailsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              RecipeDetailsError(:final message) => Center(
                child: Text(message),
              ),
              RecipeDetailsLoaded(:final recipe) => _buildContent(recipe),
            };
          },
        ),
      ),
    );
  }

  Widget _buildContent(Recipe recipe) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(recipe),
          const SizedBox(height: 16),
          _title(recipe),
          const SizedBox(height: 16),
          _section("Описание", recipe.text),
          const SizedBox(height: 16),
          _section("Ингредиенты", _combineIngredients(recipe)),
          const SizedBox(height: 16),
          _stepsSection(recipe.steps),
          const SizedBox(height: 16),
          _section("Калорийность", recipe.energy),
        ],
      ),
    );
  }

  Widget _image(Recipe recipe) {
    final url = recipe.image ?? "";

    if (url.isEmpty) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: Icon(Icons.image, size: 48)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: url,
        height: 200,
        fit: BoxFit.cover,
        placeholder: (_, __) =>
            Container(height: 200, color: Colors.grey.shade300),
        errorWidget: (_, __, ___) => Container(
          height: 200,
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image),
        ),
      ),
    );
  }

  Widget _title(Recipe recipe) {
    return Text(
      recipe.title ?? "Без названия",
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }

  Widget _section(String title, String? content) {
    if ((content ?? "").trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Text(content!, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  String _combineIngredients(Recipe recipe) {
    final parts = [
      recipe.ingredientsOne,
      recipe.ingredientsTwo,
    ].where((s) => (s ?? "").trim().isNotEmpty);

    return parts.join("\n");
  }

  Widget _stepsSection(List<RecipeStep> steps) {
    if (steps.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Шаги приготовления",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),

        ...steps.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((s.text ?? "").isNotEmpty)
                  Text(s.text!, style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 8),

                if ((s.image1 ?? "").isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: s.image1!,
                      height: 180,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          Container(height: 180, color: Colors.grey.shade300),
                      errorWidget: (_, __, ___) =>
                          Container(height: 180, color: Colors.grey.shade300),
                    ),
                  ),

                const SizedBox(height: 8),

                if ((s.image2 ?? "").isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: s.image2!,
                      height: 180,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          Container(height: 180, color: Colors.grey.shade300),
                      errorWidget: (_, __, ___) =>
                          Container(height: 180, color: Colors.grey.shade300),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
