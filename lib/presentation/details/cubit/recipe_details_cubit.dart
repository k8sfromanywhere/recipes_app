import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:recipes_app/data/repository/recipes_repository.dart';
import 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  final RecipesRepository _repository;

  RecipeDetailsCubit(this._repository) : super(const RecipeDetailsLoading());

  /// Загружаем рецепт по ID из локального кэша.
  /// API не предоставляет запрос по ID → значит мы ищем в загруженном списке.
  void load(String id) {
    emit(const RecipeDetailsLoading());

    try {
      final all = _repository.loadCached();
      final recipe = all.firstWhere(
        (r) => r.id == id,
        orElse: () => const Recipe(), // полностью пустой объект
      );

      if ((recipe.id ?? "").isEmpty) {
        emit(const RecipeDetailsError("Рецепт не найден"));
      } else {
        emit(RecipeDetailsLoaded(recipe));
      }
    } catch (_) {
      emit(const RecipeDetailsError("Ошибка загрузки рецепта"));
    }
  }
}
