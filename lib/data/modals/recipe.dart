import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    String? id,
    String? title,
    String? text,
    String? image,
    String? steps,
    String? prep_time,
    String? energy,
    String? ingredients_one,
    String? ingredients_two,
    String? date_added,
    String? link,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
