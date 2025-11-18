import 'package:recipes_app/data/datasources/recipes_api.dart';
import 'package:recipes_app/data/local/recipes_cache.dart';
import 'package:recipes_app/data/modals/recipe.dart';

class RecipesRepository {
  final RecipesApi _api;
  final RecipesCache _cache;

  RecipesRepository({required RecipesApi api, required RecipesCache cache})
    : _api = api,
      _cache = cache;
  Future<List<Recipe>> loadRecipes() async {
    try {
      final recipes = await _api.fetchRecipes();
      if (recipes.isNotEmpty) {
        await _cache.save(recipes);
      }
      return recipes;
    } catch (e) {
      final cached = _cache.load();
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }
  }

  List<Recipe> loadCached() => _cache.load();
}
