// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_investment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryInvestmentState {
  List<CategoryInvestment> get categoryInvestmentList =>
      throw _privateConstructorUsedError;
  CategoryInvestmentEnum get categoryInvestmentEnum =>
      throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryInvestmentStateCopyWith<CategoryInvestmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInvestmentStateCopyWith<$Res> {
  factory $CategoryInvestmentStateCopyWith(CategoryInvestmentState value,
          $Res Function(CategoryInvestmentState) then) =
      _$CategoryInvestmentStateCopyWithImpl<$Res, CategoryInvestmentState>;
  @useResult
  $Res call(
      {List<CategoryInvestment> categoryInvestmentList,
      CategoryInvestmentEnum categoryInvestmentEnum,
      String? userId,
      String? email});
}

/// @nodoc
class _$CategoryInvestmentStateCopyWithImpl<$Res,
        $Val extends CategoryInvestmentState>
    implements $CategoryInvestmentStateCopyWith<$Res> {
  _$CategoryInvestmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryInvestmentList = null,
    Object? categoryInvestmentEnum = null,
    Object? userId = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      categoryInvestmentList: null == categoryInvestmentList
          ? _value.categoryInvestmentList
          : categoryInvestmentList // ignore: cast_nullable_to_non_nullable
              as List<CategoryInvestment>,
      categoryInvestmentEnum: null == categoryInvestmentEnum
          ? _value.categoryInvestmentEnum
          : categoryInvestmentEnum // ignore: cast_nullable_to_non_nullable
              as CategoryInvestmentEnum,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryInvestmentStateCopyWith<$Res>
    implements $CategoryInvestmentStateCopyWith<$Res> {
  factory _$$_CategoryInvestmentStateCopyWith(_$_CategoryInvestmentState value,
          $Res Function(_$_CategoryInvestmentState) then) =
      __$$_CategoryInvestmentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryInvestment> categoryInvestmentList,
      CategoryInvestmentEnum categoryInvestmentEnum,
      String? userId,
      String? email});
}

/// @nodoc
class __$$_CategoryInvestmentStateCopyWithImpl<$Res>
    extends _$CategoryInvestmentStateCopyWithImpl<$Res,
        _$_CategoryInvestmentState>
    implements _$$_CategoryInvestmentStateCopyWith<$Res> {
  __$$_CategoryInvestmentStateCopyWithImpl(_$_CategoryInvestmentState _value,
      $Res Function(_$_CategoryInvestmentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryInvestmentList = null,
    Object? categoryInvestmentEnum = null,
    Object? userId = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_CategoryInvestmentState(
      categoryInvestmentList: null == categoryInvestmentList
          ? _value._categoryInvestmentList
          : categoryInvestmentList // ignore: cast_nullable_to_non_nullable
              as List<CategoryInvestment>,
      categoryInvestmentEnum: null == categoryInvestmentEnum
          ? _value.categoryInvestmentEnum
          : categoryInvestmentEnum // ignore: cast_nullable_to_non_nullable
              as CategoryInvestmentEnum,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CategoryInvestmentState implements _CategoryInvestmentState {
  const _$_CategoryInvestmentState(
      {final List<CategoryInvestment> categoryInvestmentList = const [],
      this.categoryInvestmentEnum = CategoryInvestmentEnum.Idle,
      this.userId,
      this.email})
      : _categoryInvestmentList = categoryInvestmentList;

  final List<CategoryInvestment> _categoryInvestmentList;
  @override
  @JsonKey()
  List<CategoryInvestment> get categoryInvestmentList {
    if (_categoryInvestmentList is EqualUnmodifiableListView)
      return _categoryInvestmentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryInvestmentList);
  }

  @override
  @JsonKey()
  final CategoryInvestmentEnum categoryInvestmentEnum;
  @override
  final String? userId;
  @override
  final String? email;

  @override
  String toString() {
    return 'CategoryInvestmentState(categoryInvestmentList: $categoryInvestmentList, categoryInvestmentEnum: $categoryInvestmentEnum, userId: $userId, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryInvestmentState &&
            const DeepCollectionEquality().equals(
                other._categoryInvestmentList, _categoryInvestmentList) &&
            (identical(other.categoryInvestmentEnum, categoryInvestmentEnum) ||
                other.categoryInvestmentEnum == categoryInvestmentEnum) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryInvestmentList),
      categoryInvestmentEnum,
      userId,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryInvestmentStateCopyWith<_$_CategoryInvestmentState>
      get copyWith =>
          __$$_CategoryInvestmentStateCopyWithImpl<_$_CategoryInvestmentState>(
              this, _$identity);
}

abstract class _CategoryInvestmentState implements CategoryInvestmentState {
  const factory _CategoryInvestmentState(
      {final List<CategoryInvestment> categoryInvestmentList,
      final CategoryInvestmentEnum categoryInvestmentEnum,
      final String? userId,
      final String? email}) = _$_CategoryInvestmentState;

  @override
  List<CategoryInvestment> get categoryInvestmentList;
  @override
  CategoryInvestmentEnum get categoryInvestmentEnum;
  @override
  String? get userId;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryInvestmentStateCopyWith<_$_CategoryInvestmentState>
      get copyWith => throw _privateConstructorUsedError;
}
