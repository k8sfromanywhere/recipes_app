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
    @JsonKey(name: 'prep_time') String? prepTime,
    String? energy,
    @JsonKey(name: 'ingredients_one') String? ingredientsOne,
    @JsonKey(name: 'ingredients_two') String? ingredientsTwo,
    @Default([]) List<RecipeStep> steps,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class RecipeStep with _$RecipeStep {
  const factory RecipeStep({
    String? text,
    @JsonKey(name: 'image1') String? image1,
    @JsonKey(name: 'image2') String? image2,
  }) = _RecipeStep;

  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);
}
