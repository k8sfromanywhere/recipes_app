import 'package:dio/dio.dart';
import 'package:recipes_app/data/models/recipe.dart';

class RecipesApi {
  final Dio _dio;

  RecipesApi(this._dio) {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseHeader: true,
        responseBody: false,
        error: true,
      ),
    );
  }

  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await _dio.get(
        'https://madeindream.com/index.php?route=api/app/getRecipes',
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers: {'Accept': 'application/json', 'User-Agent': 'Mozilla/5.0'},
        ),
      );

      final data = response.data;

      // ❗ API отдает HTML → красиво обрабатываем
      if (data is String && _looksLikeHtml(data)) {
        throw Exception("Сервер вернул некорректный ответ");
      }

      // Если text/html пришел в Map/other
      if (data is! List) throw Exception("Некорректные данные API");

      return data.map((e) => Recipe.fromJson(e)).toList();
    } on DioException {
      throw Exception("Ошибка сети. Попробуйте позже.");
    }
  }

  bool _looksLikeHtml(String value) {
    final t = value.trimLeft();
    return t.startsWith("<!") || t.startsWith("<html") || t.contains("<body>");
  }
}
