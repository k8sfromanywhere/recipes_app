import 'package:recipes_app/data/modals/recipe.dart';

sealed class RecipesListState {
  const RecipesListState();
}

final class RecipedLoading extends RecipesListState {
  const RecipedLoading();
}

final class RecipedError extends RecipesListState {
  final String message;

  const RecipedError(this.message);
}

final class RecipesOffline extends RecipesListState {
  final List<Recipe> recipe;

  const RecipesOffline(this.recipe);
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
