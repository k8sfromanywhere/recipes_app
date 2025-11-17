// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: json['id'] as String?,
  title: json['title'] as String?,
  text: json['text'] as String?,
  image: json['image'] as String?,
  steps: json['steps'] as String?,
  prep_time: json['prep_time'] as String?,
  energy: json['energy'] as String?,
  ingredients_one: json['ingredients_one'] as String?,
  ingredients_two: json['ingredients_two'] as String?,
  date_added: json['date_added'] as String?,
  link: json['link'] as String?,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'text': instance.text,
  'image': instance.image,
  'steps': instance.steps,
  'prep_time': instance.prep_time,
  'energy': instance.energy,
  'ingredients_one': instance.ingredients_one,
  'ingredients_two': instance.ingredients_two,
  'date_added': instance.date_added,
  'link': instance.link,
};
