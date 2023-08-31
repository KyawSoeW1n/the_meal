// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_category_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealCategoryVO {
  String get name => throw _privateConstructorUsedError;

  String get image => throw _privateConstructorUsedError;

  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealCategoryVOCopyWith<MealCategoryVO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCategoryVOCopyWith<$Res> {
  factory $MealCategoryVOCopyWith(
          MealCategoryVO value, $Res Function(MealCategoryVO) then) =
      _$MealCategoryVOCopyWithImpl<$Res, MealCategoryVO>;

  @useResult
  $Res call({String name, String image, String id});
}

/// @nodoc
class _$MealCategoryVOCopyWithImpl<$Res, $Val extends MealCategoryVO>
    implements $MealCategoryVOCopyWith<$Res> {
  _$MealCategoryVOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealCategoryVOCopyWith<$Res>
    implements $MealCategoryVOCopyWith<$Res> {
  factory _$$_MealCategoryVOCopyWith(
          _$_MealCategoryVO value, $Res Function(_$_MealCategoryVO) then) =
      __$$_MealCategoryVOCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String name, String image, String id});
}

/// @nodoc
class __$$_MealCategoryVOCopyWithImpl<$Res>
    extends _$MealCategoryVOCopyWithImpl<$Res, _$_MealCategoryVO>
    implements _$$_MealCategoryVOCopyWith<$Res> {
  __$$_MealCategoryVOCopyWithImpl(
      _$_MealCategoryVO _value, $Res Function(_$_MealCategoryVO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_$_MealCategoryVO(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MealCategoryVO implements _MealCategoryVO {
  const _$_MealCategoryVO(
      {required this.name, required this.image, required this.id});

  @override
  final String name;
  @override
  final String image;
  @override
  final String id;

  @override
  String toString() {
    return 'MealCategoryVO(name: $name, image: $image, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealCategoryVO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, image, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealCategoryVOCopyWith<_$_MealCategoryVO> get copyWith =>
      __$$_MealCategoryVOCopyWithImpl<_$_MealCategoryVO>(this, _$identity);
}

abstract class _MealCategoryVO implements MealCategoryVO {
  const factory _MealCategoryVO(
      {required final String name,
      required final String image,
      required final String id}) = _$_MealCategoryVO;

  @override
  String get name;

  @override
  String get image;

  @override
  String get id;

  @override
  @JsonKey(ignore: true)
  _$$_MealCategoryVOCopyWith<_$_MealCategoryVO> get copyWith =>
      throw _privateConstructorUsedError;
}
