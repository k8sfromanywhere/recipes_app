import 'dart:convert';
import 'package:recipes_app/data/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipesCache {
  final SharedPreferences _prefs;

  RecipesCache(this._prefs);

  Future<void> save(List<Recipe> recipes) async {
    try {
      final encoded = jsonEncode(
        recipes.map((recipe) => recipe.toJson()).toList(),
      );

      await _prefs.setString("recipes_cache", encoded);
    } catch (_) {}
  }

  List<Recipe> load() {
    try {
      final raw = _prefs.getString("recipes_cache");

      if (raw == null) return [];

      final decoded = jsonDecode(raw) as List<dynamic>;

      return decoded
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }
}
