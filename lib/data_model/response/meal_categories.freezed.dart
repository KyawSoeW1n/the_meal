// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MealCategories _$MealCategoriesFromJson(Map<String, dynamic> json) {
  return _MealCategories.fromJson(json);
}

/// @nodoc
mixin _$MealCategories {
  List<Category> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealCategoriesCopyWith<MealCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCategoriesCopyWith<$Res> {
  factory $MealCategoriesCopyWith(
          MealCategories value, $Res Function(MealCategories) then) =
      _$MealCategoriesCopyWithImpl<$Res, MealCategories>;

  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class _$MealCategoriesCopyWithImpl<$Res, $Val extends MealCategories>
    implements $MealCategoriesCopyWith<$Res> {
  _$MealCategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealCategoriesCopyWith<$Res>
    implements $MealCategoriesCopyWith<$Res> {
  factory _$$_MealCategoriesCopyWith(
          _$_MealCategories value, $Res Function(_$_MealCategories) then) =
      __$$_MealCategoriesCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$_MealCategoriesCopyWithImpl<$Res>
    extends _$MealCategoriesCopyWithImpl<$Res, _$_MealCategories>
    implements _$$_MealCategoriesCopyWith<$Res> {
  __$$_MealCategoriesCopyWithImpl(
      _$_MealCategories _value, $Res Function(_$_MealCategories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$_MealCategories(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MealCategories implements _MealCategories {
  const _$_MealCategories({required final List<Category> categories})
      : _categories = categories;

  factory _$_MealCategories.fromJson(Map<String, dynamic> json) =>
      _$$_MealCategoriesFromJson(json);

  final List<Category> _categories;

  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MealCategories(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealCategories &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealCategoriesCopyWith<_$_MealCategories> get copyWith =>
      __$$_MealCategoriesCopyWithImpl<_$_MealCategories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MealCategoriesToJson(
      this,
    );
  }
}

abstract class _MealCategories implements MealCategories {
  const factory _MealCategories({required final List<Category> categories}) =
      _$_MealCategories;

  factory _MealCategories.fromJson(Map<String, dynamic> json) =
      _$_MealCategories.fromJson;

  @override
  List<Category> get categories;

  @override
  @JsonKey(ignore: true)
  _$$_MealCategoriesCopyWith<_$_MealCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get idCategory => throw _privateConstructorUsedError;

  String get strCategory => throw _privateConstructorUsedError;

  String get strCategoryThumb => throw _privateConstructorUsedError;

  String get strCategoryDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;

  @useResult
  $Res call(
      {String idCategory,
      String strCategory,
      String strCategoryThumb,
      String strCategoryDescription});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = null,
    Object? strCategoryDescription = null,
  }) {
    return _then(_value.copyWith(
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: null == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryThumb: null == strCategoryThumb
          ? _value.strCategoryThumb
          : strCategoryThumb // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryDescription: null == strCategoryDescription
          ? _value.strCategoryDescription
          : strCategoryDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String idCategory,
      String strCategory,
      String strCategoryThumb,
      String strCategoryDescription});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = null,
    Object? strCategoryDescription = null,
  }) {
    return _then(_$_Category(
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: null == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryThumb: null == strCategoryThumb
          ? _value.strCategoryThumb
          : strCategoryThumb // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryDescription: null == strCategoryDescription
          ? _value.strCategoryDescription
          : strCategoryDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumb,
      required this.strCategoryDescription});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final String idCategory;
  @override
  final String strCategory;
  @override
  final String strCategoryThumb;
  @override
  final String strCategoryDescription;

  @override
  String toString() {
    return 'Category(idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb) &&
            (identical(other.strCategoryDescription, strCategoryDescription) ||
                other.strCategoryDescription == strCategoryDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCategory, strCategory,
      strCategoryThumb, strCategoryDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String idCategory,
      required final String strCategory,
      required final String strCategoryThumb,
      required final String strCategoryDescription}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String get idCategory;

  @override
  String get strCategory;

  @override
  String get strCategoryThumb;

  @override
  String get strCategoryDescription;

  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
