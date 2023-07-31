// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_three_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStepThreeState {
  FormzStatus get formzStatus => throw _privateConstructorUsedError;
  GenreForm get genre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepThreeStateCopyWith<OnboardingStepThreeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepThreeStateCopyWith<$Res> {
  factory $OnboardingStepThreeStateCopyWith(OnboardingStepThreeState value,
          $Res Function(OnboardingStepThreeState) then) =
      _$OnboardingStepThreeStateCopyWithImpl<$Res, OnboardingStepThreeState>;
  @useResult
  $Res call({FormzStatus formzStatus, GenreForm genre});
}

/// @nodoc
class _$OnboardingStepThreeStateCopyWithImpl<$Res,
        $Val extends OnboardingStepThreeState>
    implements $OnboardingStepThreeStateCopyWith<$Res> {
  _$OnboardingStepThreeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? genre = null,
  }) {
    return _then(_value.copyWith(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as GenreForm,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStepThreeStateCopyWith<$Res>
    implements $OnboardingStepThreeStateCopyWith<$Res> {
  factory _$$_OnboardingStepThreeStateCopyWith(
          _$_OnboardingStepThreeState value,
          $Res Function(_$_OnboardingStepThreeState) then) =
      __$$_OnboardingStepThreeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus formzStatus, GenreForm genre});
}

/// @nodoc
class __$$_OnboardingStepThreeStateCopyWithImpl<$Res>
    extends _$OnboardingStepThreeStateCopyWithImpl<$Res,
        _$_OnboardingStepThreeState>
    implements _$$_OnboardingStepThreeStateCopyWith<$Res> {
  __$$_OnboardingStepThreeStateCopyWithImpl(_$_OnboardingStepThreeState _value,
      $Res Function(_$_OnboardingStepThreeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? genre = null,
  }) {
    return _then(_$_OnboardingStepThreeState(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as GenreForm,
    ));
  }
}

/// @nodoc

class _$_OnboardingStepThreeState implements _OnboardingStepThreeState {
  const _$_OnboardingStepThreeState(
      {this.formzStatus = FormzStatus.pure,
      this.genre = const GenreForm.pure()});

  @override
  @JsonKey()
  final FormzStatus formzStatus;
  @override
  @JsonKey()
  final GenreForm genre;

  @override
  String toString() {
    return 'OnboardingStepThreeState(formzStatus: $formzStatus, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingStepThreeState &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, genre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStepThreeStateCopyWith<_$_OnboardingStepThreeState>
      get copyWith => __$$_OnboardingStepThreeStateCopyWithImpl<
          _$_OnboardingStepThreeState>(this, _$identity);
}

abstract class _OnboardingStepThreeState implements OnboardingStepThreeState {
  const factory _OnboardingStepThreeState(
      {final FormzStatus formzStatus,
      final GenreForm genre}) = _$_OnboardingStepThreeState;

  @override
  FormzStatus get formzStatus;
  @override
  GenreForm get genre;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStepThreeStateCopyWith<_$_OnboardingStepThreeState>
      get copyWith => throw _privateConstructorUsedError;
}
