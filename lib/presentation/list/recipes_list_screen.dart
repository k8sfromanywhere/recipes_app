import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/modals/recipe.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_cubit.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_state.dart';
import 'package:recipes_app/presentation/list/widgets/error_retry.dart';
import 'package:recipes_app/presentation/list/widgets/recipe_card.dart';

class RecipesListScreen extends StatefulWidget {
  const RecipesListScreen({super.key});

  @override
  State<RecipesListScreen> createState() => _RecipesListScreenState();
}

class _RecipesListScreenState extends State<RecipesListScreen> {
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<RecipesListCubit>().load();

    _scroll.addListener(() {
      final cubit = context.read<RecipesListCubit>();
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 300) {
        cubit.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Рецепты')),
      body: BlocBuilder<RecipesListCubit, RecipesListState>(
        builder: (context, state) {
          return switch (state) {
            RecipesLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            RecipedError(:final message) => ErrorRetry(
              message: message,
              onRetry: () {
                context.read<RecipesListCubit>().load();
              },
            ),
            RecipesOffline(:final recipes) => _buildList(
              context,
              recipes,
              isOffline: true,
            ),
            RecipesEmpty() => const Center(child: Text('Нет рецептов')),
            RecipesLoaded(:final paginated, :final isLoadingMore) => _buildList(
              context,
              paginated,
              isLoadingMore: isLoadingMore,
            ),
            // _ => const SizedBox(),
          };
        },
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    List<Recipe> items, {
    bool isOffline = false,
    bool isLoadingMore = false,
  }) {
    return RefreshIndicator(
      onRefresh: () => context.read<RecipesListCubit>().refresh(),
      child: ListView.builder(
        controller: _scroll,
        padding: const EdgeInsets.all(12),
        itemCount: items.length + (isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final recipe = items[index];
          return RecipeCard(recipe: recipe, isOffline: isOffline);
        },
      ),
    );
  }
}
