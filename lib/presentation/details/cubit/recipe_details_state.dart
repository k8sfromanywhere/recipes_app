import 'package:recipes_app/data/models/recipe.dart';

sealed class RecipeDetailsState {
  const RecipeDetailsState();
}

final class RecipeDetailsLoading extends RecipeDetailsState {
  const RecipeDetailsLoading();
}

final class RecipeDetailsError extends RecipeDetailsState {
  final String message;
  const RecipeDetailsError(this.message);
}

final class RecipeDetailsLoaded extends RecipeDetailsState {
  final Recipe recipe;
  const RecipeDetailsLoaded(this.recipe);
}
