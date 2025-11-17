// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {

 String? get id; String? get title; String? get text; String? get image; String? get steps; String? get prep_time; String? get energy; String? get ingredients_one; String? get ingredients_two; String? get date_added; String? get link;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text)&&(identical(other.image, image) || other.image == image)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.prep_time, prep_time) || other.prep_time == prep_time)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.ingredients_one, ingredients_one) || other.ingredients_one == ingredients_one)&&(identical(other.ingredients_two, ingredients_two) || other.ingredients_two == ingredients_two)&&(identical(other.date_added, date_added) || other.date_added == date_added)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,text,image,steps,prep_time,energy,ingredients_one,ingredients_two,date_added,link);

@override
String toString() {
  return 'Recipe(id: $id, title: $title, text: $text, image: $image, steps: $steps, prep_time: $prep_time, energy: $energy, ingredients_one: $ingredients_one, ingredients_two: $ingredients_two, date_added: $date_added, link: $link)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? text, String? image, String? steps, String? prep_time, String? energy, String? ingredients_one, String? ingredients_two, String? date_added, String? link
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? text = freezed,Object? image = freezed,Object? steps = freezed,Object? prep_time = freezed,Object? energy = freezed,Object? ingredients_one = freezed,Object? ingredients_two = freezed,Object? date_added = freezed,Object? link = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as String?,prep_time: freezed == prep_time ? _self.prep_time : prep_time // ignore: cast_nullable_to_non_nullable
as String?,energy: freezed == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as String?,ingredients_one: freezed == ingredients_one ? _self.ingredients_one : ingredients_one // ignore: cast_nullable_to_non_nullable
as String?,ingredients_two: freezed == ingredients_two ? _self.ingredients_two : ingredients_two // ignore: cast_nullable_to_non_nullable
as String?,date_added: freezed == date_added ? _self.date_added : date_added // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? text,  String? image,  String? steps,  String? prep_time,  String? energy,  String? ingredients_one,  String? ingredients_two,  String? date_added,  String? link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.title,_that.text,_that.image,_that.steps,_that.prep_time,_that.energy,_that.ingredients_one,_that.ingredients_two,_that.date_added,_that.link);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? text,  String? image,  String? steps,  String? prep_time,  String? energy,  String? ingredients_one,  String? ingredients_two,  String? date_added,  String? link)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
return $default(_that.id,_that.title,_that.text,_that.image,_that.steps,_that.prep_time,_that.energy,_that.ingredients_one,_that.ingredients_two,_that.date_added,_that.link);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? text,  String? image,  String? steps,  String? prep_time,  String? energy,  String? ingredients_one,  String? ingredients_two,  String? date_added,  String? link)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.title,_that.text,_that.image,_that.steps,_that.prep_time,_that.energy,_that.ingredients_one,_that.ingredients_two,_that.date_added,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({this.id, this.title, this.text, this.image, this.steps, this.prep_time, this.energy, this.ingredients_one, this.ingredients_two, this.date_added, this.link});
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override final  String? id;
@override final  String? title;
@override final  String? text;
@override final  String? image;
@override final  String? steps;
@override final  String? prep_time;
@override final  String? energy;
@override final  String? ingredients_one;
@override final  String? ingredients_two;
@override final  String? date_added;
@override final  String? link;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text)&&(identical(other.image, image) || other.image == image)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.prep_time, prep_time) || other.prep_time == prep_time)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.ingredients_one, ingredients_one) || other.ingredients_one == ingredients_one)&&(identical(other.ingredients_two, ingredients_two) || other.ingredients_two == ingredients_two)&&(identical(other.date_added, date_added) || other.date_added == date_added)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,text,image,steps,prep_time,energy,ingredients_one,ingredients_two,date_added,link);

@override
String toString() {
  return 'Recipe(id: $id, title: $title, text: $text, image: $image, steps: $steps, prep_time: $prep_time, energy: $energy, ingredients_one: $ingredients_one, ingredients_two: $ingredients_two, date_added: $date_added, link: $link)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? text, String? image, String? steps, String? prep_time, String? energy, String? ingredients_one, String? ingredients_two, String? date_added, String? link
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? text = freezed,Object? image = freezed,Object? steps = freezed,Object? prep_time = freezed,Object? energy = freezed,Object? ingredients_one = freezed,Object? ingredients_two = freezed,Object? date_added = freezed,Object? link = freezed,}) {
  return _then(_Recipe(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as String?,prep_time: freezed == prep_time ? _self.prep_time : prep_time // ignore: cast_nullable_to_non_nullable
as String?,energy: freezed == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as String?,ingredients_one: freezed == ingredients_one ? _self.ingredients_one : ingredients_one // ignore: cast_nullable_to_non_nullable
as String?,ingredients_two: freezed == ingredients_two ? _self.ingredients_two : ingredients_two // ignore: cast_nullable_to_non_nullable
as String?,date_added: freezed == date_added ? _self.date_added : date_added // ignore: cast_nullable_to_non_nullable
as String?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
