import 'dart:convert';
import 'package:recipes_app/data/modals/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipesCache {
  final SharedPreferences _prefs;

  RecipesCache(this._prefs);

  /// Сохранение списка рецептов в локальное хранилище.
  Future<void> save(List<Recipe> recipes) async {
    try {
      final encoded = jsonEncode(
        recipes.map((recipe) => recipe.toJson()).toList(),
      );

      await _prefs.setString("recipes_cache", encoded);
    } catch (_) {
      // Если по какой-то причине сериализация упала — ничего страшного,
      // просто не кэшируем. Офлайн будет пустым.
    }
  }

  /// Загрузка кэша. Если данных нет — возвращаем пустой список.
  List<Recipe> load() {
    try {
      final raw = _prefs.getString("recipes_cache");

      if (raw == null) return [];

      final decoded = jsonDecode(raw) as List<dynamic>;

      return decoded
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      // Если кэш повреждён — лучше вернуть пустой список,
      // чем крашить приложение.
      return [];
    }
  }
}
