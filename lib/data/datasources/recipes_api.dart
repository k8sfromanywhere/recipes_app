// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:recipes_app/data/models/recipe.dart';

// class RecipesApi {
//   final Dio _dio;

//   RecipesApi(this._dio) {
//     _dio.interceptors.add(
//       LogInterceptor(
//         request: true,
//         requestBody: false,
//         responseBody: false,
//         error: true,
//       ),
//     );
//   }
//   Future<List<Recipe>> fetchRecipes() async {
//     try {
//       final response = await _dio.get(
//         'https://madeindream.com/index.php?route=api/app/getRecipes',
//         options: Options(
//           sendTimeout: const Duration(seconds: 5),
//           receiveTimeout: const Duration(seconds: 5),
//           headers: const {
//             'Accept': 'application/json',
//             'X-Requested-With': 'XMLHttpRequest',
//           },
//         ),
//       );
//       final data = _extractPayload(response.data);
//       if (response.statusCode == 200 && data is List) {
//         return data
//             .whereType<Map<String, dynamic>>()
//             .map(Recipe.fromJson)
//             .toList();
//       }
//       throw Exception('Некорректный формат API');
//     } on DioException catch (e) {
//       final message = switch (e.type) {
//         DioExceptionType.connectionTimeout =>
//           "Превышено время ожидания соединения",
//         DioExceptionType.receiveTimeout =>
//           "Истекло время ожидания ответа от сервера",
//         DioExceptionType.connectionError => "Нет подключения к серверу",
//         _ => "Ошибка при загрузке рецептов",
//       };
//       throw Exception(message);
//     } catch (_) {
//       throw Exception("Не удалось загрузить рецепты");
//     }
//   }

//   dynamic _extractPayload(dynamic data) {
//     if (data is List) return data;

//     if (data is Map<String, dynamic>) {
//       final possibleList = data['recipes'] ?? data['data'];
//       if (possibleList is List) return possibleList;
//       return data;
//     }

//     if (data is String) {
//       final trimmed = data.trim();
//       if (trimmed.isEmpty) return const [];
//       try {
//         final decoded = jsonDecode(trimmed);
//         return _extractPayload(decoded);
//       } catch (_) {
//         return data;
//       }
//     }

//     return data;
//   }
// }

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:recipes_app/data/models/recipe.dart';

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
          headers: const {
            'Accept': 'application/json',
            'User-Agent': 'Mozilla/5.0',
          },
        ),
      );

      final raw = response.data;

      // ---------- CASE 1: HTML вместо JSON ----------
      if (raw is String && _looksLikeHtml(raw)) {
        throw Exception("Сервер вернул HTML вместо JSON");
      }

      // ---------- CASE 2: JSON пришёл строкой ----------
      if (raw is String) {
        try {
          return _parseList(jsonDecode(raw));
        } catch (_) {
          throw Exception("Сервер вернул некорректный JSON");
        }
      }

      // ---------- CASE 3: JSON как Map или List ----------
      return _parseList(raw);
    } on DioException catch (e) {
      final message = switch (e.type) {
        DioExceptionType.connectionTimeout =>
          "Превышено время ожидания соединения",
        DioExceptionType.receiveTimeout =>
          "Истекло время ожидания ответа от сервера",
        DioExceptionType.connectionError => "Нет подключения к серверу",
        _ => "Ошибка при загрузке рецептов",
      };
      throw Exception(message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Проверка на HTML
  bool _looksLikeHtml(String s) {
    final t = s.trimLeft();
    return t.startsWith("<!") ||
        t.startsWith("<html") ||
        t.contains("<head>") ||
        t.contains("<body>");
  }

  // Корректный разбор структуры API
  List<Recipe> _parseList(dynamic data) {
    // 1. Текущее API: {"news": [ ... ]}
    if (data is Map<String, dynamic>) {
      final list = data["news"];
      if (list is List) {
        return list
            .whereType<Map<String, dynamic>>()
            .map((e) => Recipe.fromJson(e))
            .toList();
      }
    }

    // 2. Fallback: чистый список
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map((e) => Recipe.fromJson(e))
          .toList();
    }

    throw Exception("Сервер вернул некорректный формат данных");
  }
}
