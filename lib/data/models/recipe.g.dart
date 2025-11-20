// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
  id: json['id'] as String?,
  title: json['title'] as String?,
  text: json['text'] as String?,
  image: json['image'] as String?,
  prepTime: json['prep_time'] as String?,
  energy: json['energy'] as String?,
  ingredientsOne: json['ingredients_one'] as String?,
  ingredientsTwo: json['ingredients_two'] as String?,
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'image': instance.image,
      'prep_time': instance.prepTime,
      'energy': instance.energy,
      'ingredients_one': instance.ingredientsOne,
      'ingredients_two': instance.ingredientsTwo,
      'steps': instance.steps,
    };

_$RecipeStepImpl _$$RecipeStepImplFromJson(Map<String, dynamic> json) =>
    _$RecipeStepImpl(
      text: json['text'] as String?,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
    );

Map<String, dynamic> _$$RecipeStepImplToJson(_$RecipeStepImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image1': instance.image1,
      'image2': instance.image2,
    };
