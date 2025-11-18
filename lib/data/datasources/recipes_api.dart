import 'package:dio/dio.dart';
import 'package:recipes_app/data/modals/recipe.dart';

class RecipesApi {
  final Dio _dio;

  RecipesApi(this._dio) {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: false,
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
        ),
      );
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List).map((e) => Recipe.fromJson(e)).toList();
      }
      throw Exception('Некорректный формат API');
    } on DioException catch (e) {
      // Нормальная человекочитаемая ошибка
      final message = switch (e.type) {
        DioExceptionType.connectionTimeout =>
          "Превышено время ожидания соединения",
        DioExceptionType.receiveTimeout =>
          "Истекло время ожидания ответа от сервера",
        DioExceptionType.connectionError => "Нет подключения к серверу",
        _ => "Ошибка при загрузке рецептов",
      };
      throw Exception(message);
    } catch (_) {
      throw Exception("Не удалось загрузить рецепты");
    }
  }
}
