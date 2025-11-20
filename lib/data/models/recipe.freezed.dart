// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'prep_time')
  String? get prepTime => throw _privateConstructorUsedError;
  String? get energy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_one')
  String? get ingredientsOne => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_two')
  String? get ingredientsTwo => throw _privateConstructorUsedError;
  List<RecipeStep> get steps => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call({
    String? id,
    String? title,
    String? text,
    String? image,
    @JsonKey(name: 'prep_time') String? prepTime,
    String? energy,
    @JsonKey(name: 'ingredients_one') String? ingredientsOne,
    @JsonKey(name: 'ingredients_two') String? ingredientsTwo,
    List<RecipeStep> steps,
  });
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? image = freezed,
    Object? prepTime = freezed,
    Object? energy = freezed,
    Object? ingredientsOne = freezed,
    Object? ingredientsTwo = freezed,
    Object? steps = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            prepTime: freezed == prepTime
                ? _value.prepTime
                : prepTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            energy: freezed == energy
                ? _value.energy
                : energy // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredientsOne: freezed == ingredientsOne
                ? _value.ingredientsOne
                : ingredientsOne // ignore: cast_nullable_to_non_nullable
                      as String?,
            ingredientsTwo: freezed == ingredientsTwo
                ? _value.ingredientsTwo
                : ingredientsTwo // ignore: cast_nullable_to_non_nullable
                      as String?,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as List<RecipeStep>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
    _$RecipeImpl value,
    $Res Function(_$RecipeImpl) then,
  ) = __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? title,
    String? text,
    String? image,
    @JsonKey(name: 'prep_time') String? prepTime,
    String? energy,
    @JsonKey(name: 'ingredients_one') String? ingredientsOne,
    @JsonKey(name: 'ingredients_two') String? ingredientsTwo,
    List<RecipeStep> steps,
  });
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
    _$RecipeImpl _value,
    $Res Function(_$RecipeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? image = freezed,
    Object? prepTime = freezed,
    Object? energy = freezed,
    Object? ingredientsOne = freezed,
    Object? ingredientsTwo = freezed,
    Object? steps = null,
  }) {
    return _then(
      _$RecipeImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        prepTime: freezed == prepTime
            ? _value.prepTime
            : prepTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        energy: freezed == energy
            ? _value.energy
            : energy // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredientsOne: freezed == ingredientsOne
            ? _value.ingredientsOne
            : ingredientsOne // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredientsTwo: freezed == ingredientsTwo
            ? _value.ingredientsTwo
            : ingredientsTwo // ignore: cast_nullable_to_non_nullable
                  as String?,
        steps: null == steps
            ? _value._steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as List<RecipeStep>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl({
    this.id,
    this.title,
    this.text,
    this.image,
    @JsonKey(name: 'prep_time') this.prepTime,
    this.energy,
    @JsonKey(name: 'ingredients_one') this.ingredientsOne,
    @JsonKey(name: 'ingredients_two') this.ingredientsTwo,
    final List<RecipeStep> steps = const [],
  }) : _steps = steps;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? text;
  @override
  final String? image;
  @override
  @JsonKey(name: 'prep_time')
  final String? prepTime;
  @override
  final String? energy;
  @override
  @JsonKey(name: 'ingredients_one')
  final String? ingredientsOne;
  @override
  @JsonKey(name: 'ingredients_two')
  final String? ingredientsTwo;
  final List<RecipeStep> _steps;
  @override
  @JsonKey()
  List<RecipeStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, text: $text, image: $image, prepTime: $prepTime, energy: $energy, ingredientsOne: $ingredientsOne, ingredientsTwo: $ingredientsTwo, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.prepTime, prepTime) ||
                other.prepTime == prepTime) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.ingredientsOne, ingredientsOne) ||
                other.ingredientsOne == ingredientsOne) &&
            (identical(other.ingredientsTwo, ingredientsTwo) ||
                other.ingredientsTwo == ingredientsTwo) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    text,
    image,
    prepTime,
    energy,
    ingredientsOne,
    ingredientsTwo,
    const DeepCollectionEquality().hash(_steps),
  );

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(this);
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe({
    final String? id,
    final String? title,
    final String? text,
    final String? image,
    @JsonKey(name: 'prep_time') final String? prepTime,
    final String? energy,
    @JsonKey(name: 'ingredients_one') final String? ingredientsOne,
    @JsonKey(name: 'ingredients_two') final String? ingredientsTwo,
    final List<RecipeStep> steps,
  }) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get text;
  @override
  String? get image;
  @override
  @JsonKey(name: 'prep_time')
  String? get prepTime;
  @override
  String? get energy;
  @override
  @JsonKey(name: 'ingredients_one')
  String? get ingredientsOne;
  @override
  @JsonKey(name: 'ingredients_two')
  String? get ingredientsTwo;
  @override
  List<RecipeStep> get steps;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return _RecipeStep.fromJson(json);
}

/// @nodoc
mixin _$RecipeStep {
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'image1')
  String? get image1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'image2')
  String? get image2 => throw _privateConstructorUsedError;

  /// Serializes this RecipeStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeStepCopyWith<RecipeStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStepCopyWith<$Res> {
  factory $RecipeStepCopyWith(
    RecipeStep value,
    $Res Function(RecipeStep) then,
  ) = _$RecipeStepCopyWithImpl<$Res, RecipeStep>;
  @useResult
  $Res call({
    String? text,
    @JsonKey(name: 'image1') String? image1,
    @JsonKey(name: 'image2') String? image2,
  });
}

/// @nodoc
class _$RecipeStepCopyWithImpl<$Res, $Val extends RecipeStep>
    implements $RecipeStepCopyWith<$Res> {
  _$RecipeStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? image1 = freezed,
    Object? image2 = freezed,
  }) {
    return _then(
      _value.copyWith(
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            image1: freezed == image1
                ? _value.image1
                : image1 // ignore: cast_nullable_to_non_nullable
                      as String?,
            image2: freezed == image2
                ? _value.image2
                : image2 // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeStepImplCopyWith<$Res>
    implements $RecipeStepCopyWith<$Res> {
  factory _$$RecipeStepImplCopyWith(
    _$RecipeStepImpl value,
    $Res Function(_$RecipeStepImpl) then,
  ) = __$$RecipeStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? text,
    @JsonKey(name: 'image1') String? image1,
    @JsonKey(name: 'image2') String? image2,
  });
}

/// @nodoc
class __$$RecipeStepImplCopyWithImpl<$Res>
    extends _$RecipeStepCopyWithImpl<$Res, _$RecipeStepImpl>
    implements _$$RecipeStepImplCopyWith<$Res> {
  __$$RecipeStepImplCopyWithImpl(
    _$RecipeStepImpl _value,
    $Res Function(_$RecipeStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? image1 = freezed,
    Object? image2 = freezed,
  }) {
    return _then(
      _$RecipeStepImpl(
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        image1: freezed == image1
            ? _value.image1
            : image1 // ignore: cast_nullable_to_non_nullable
                  as String?,
        image2: freezed == image2
            ? _value.image2
            : image2 // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeStepImpl implements _RecipeStep {
  const _$RecipeStepImpl({
    this.text,
    @JsonKey(name: 'image1') this.image1,
    @JsonKey(name: 'image2') this.image2,
  });

  factory _$RecipeStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeStepImplFromJson(json);

  @override
  final String? text;
  @override
  @JsonKey(name: 'image1')
  final String? image1;
  @override
  @JsonKey(name: 'image2')
  final String? image2;

  @override
  String toString() {
    return 'RecipeStep(text: $text, image1: $image1, image2: $image2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStepImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image1, image1) || other.image1 == image1) &&
            (identical(other.image2, image2) || other.image2 == image2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, image1, image2);

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStepImplCopyWith<_$RecipeStepImpl> get copyWith =>
      __$$RecipeStepImplCopyWithImpl<_$RecipeStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeStepImplToJson(this);
  }
}

abstract class _RecipeStep implements RecipeStep {
  const factory _RecipeStep({
    final String? text,
    @JsonKey(name: 'image1') final String? image1,
    @JsonKey(name: 'image2') final String? image2,
  }) = _$RecipeStepImpl;

  factory _RecipeStep.fromJson(Map<String, dynamic> json) =
      _$RecipeStepImpl.fromJson;

  @override
  String? get text;
  @override
  @JsonKey(name: 'image1')
  String? get image1;
  @override
  @JsonKey(name: 'image2')
  String? get image2;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeStepImplCopyWith<_$RecipeStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
