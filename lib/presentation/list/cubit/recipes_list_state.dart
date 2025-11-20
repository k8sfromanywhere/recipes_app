import 'package:recipes_app/data/models/recipe.dart';

sealed class RecipesListState {
  const RecipesListState();
}

final class RecipesLoading extends RecipesListState {
  const RecipesLoading();
}

final class RecipesError extends RecipesListState {
  final String message;

  const RecipesError(this.message);
}

final class RecipesOffline extends RecipesListState {
  final List<Recipe> recipes;

  const RecipesOffline(this.recipes);
}

final class RecipesEmpty extends RecipesListState {
  const RecipesEmpty();
}

final class RecipesLoaded extends RecipesListState {
  final List<Recipe> allRecipes;
  final List<Recipe> paginated;
  final int page;
  final bool isLastPage;
  final bool isLoadingMore;

  const RecipesLoaded({
    required this.allRecipes,
    required this.paginated,
    required this.page,
    required this.isLastPage,
    required this.isLoadingMore,
  });

  RecipesLoaded copyWith({
    List<Recipe>? allRecipes,
    List<Recipe>? paginated,
    int? page,
    bool? isLastPage,
    bool? isLoadingMore,
  }) {
    return RecipesLoaded(
      allRecipes: allRecipes ?? this.allRecipes,
      paginated: paginated ?? this.paginated,
      page: page ?? this.page,
      isLastPage: isLastPage ?? this.isLastPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
