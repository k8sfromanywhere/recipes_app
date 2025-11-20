import 'package:recipes_app/data/models/recipe.dart';

/// поиск, фильтры, пагинация
class RecipesInteractor {
  List<Recipe> applySearch(List<Recipe> list, String query) {
    if (query.isEmpty) return list;

    final lower = query.toLowerCase();

    return list.where((recipe) {
      return (recipe.title ?? '').toLowerCase().contains(lower) ||
          (recipe.ingredientsOne ?? '').toLowerCase().contains(lower) ||
          (recipe.ingredientsTwo ?? '').toLowerCase().contains(lower);
    }).toList();
  }

  /// только с изображениями, до N минут (если prep_time корректный)
  List<Recipe> applyFilters(
    List<Recipe> list, {
    bool onlyWithImages = false,
    int? maxMinutes,
  }) {
    var filtered = list;

    if (onlyWithImages) {
      filtered = filtered.where((r) => (r.image ?? '').isNotEmpty).toList();
    }

    if (maxMinutes != null) {
      filtered = filtered.where((r) {
        final raw = r.prepTime?.trim() ?? '';
        final minutes = int.tryParse(raw);

        return minutes != null && minutes <= maxMinutes;
      }).toList();
    }

    return filtered;
  }

  /// пагинация по 10 элементов
  List<Recipe> paginate(List<Recipe> list, int page, int pageSize) {
    final start = page * pageSize;
    if (start >= list.length) return [];

    return list.skip(start).take(pageSize).toList();
  }
}
