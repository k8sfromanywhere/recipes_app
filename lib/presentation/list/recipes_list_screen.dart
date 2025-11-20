import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_cubit.dart';
import 'package:recipes_app/presentation/list/cubit/recipes_list_state.dart';
import 'package:recipes_app/presentation/list/widgets/error_retry.dart';
import 'package:recipes_app/presentation/list/widgets/recipe_card.dart';
import 'package:recipes_app/presentation/theme/theme_cubit.dart';

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

      // не догружаем, если уже идёт догрузка
      final current = cubit.state;
      final loadingMore = current is RecipesLoaded && current.isLoadingMore;

      if (!loadingMore &&
          _scroll.position.pixels >= _scroll.position.maxScrollExtent - 250) {
        cubit.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепты'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeCubit>().state
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: BlocBuilder<RecipesListCubit, RecipesListState>(
        builder: (context, state) {
          return switch (state) {
            RecipesLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            RecipesError(:final message) => ErrorRetry(
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
              padding: EdgeInsets.symmetric(vertical: 16),
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
