// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_child_text_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStepChildTextState {
  FormzStatus get formzStatus => throw _privateConstructorUsedError;
  ChildCountForm get childCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepChildTextStateCopyWith<OnboardingStepChildTextState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepChildTextStateCopyWith<$Res> {
  factory $OnboardingStepChildTextStateCopyWith(
          OnboardingStepChildTextState value,
          $Res Function(OnboardingStepChildTextState) then) =
      _$OnboardingStepChildTextStateCopyWithImpl<$Res,
          OnboardingStepChildTextState>;
  @useResult
  $Res call({FormzStatus formzStatus, ChildCountForm childCount});
}

/// @nodoc
class _$OnboardingStepChildTextStateCopyWithImpl<$Res,
        $Val extends OnboardingStepChildTextState>
    implements $OnboardingStepChildTextStateCopyWith<$Res> {
  _$OnboardingStepChildTextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? childCount = null,
  }) {
    return _then(_value.copyWith(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      childCount: null == childCount
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as ChildCountForm,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStepChildTextStateCopyWith<$Res>
    implements $OnboardingStepChildTextStateCopyWith<$Res> {
  factory _$$_OnboardingStepChildTextStateCopyWith(
          _$_OnboardingStepChildTextState value,
          $Res Function(_$_OnboardingStepChildTextState) then) =
      __$$_OnboardingStepChildTextStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus formzStatus, ChildCountForm childCount});
}

/// @nodoc
class __$$_OnboardingStepChildTextStateCopyWithImpl<$Res>
    extends _$OnboardingStepChildTextStateCopyWithImpl<$Res,
        _$_OnboardingStepChildTextState>
    implements _$$_OnboardingStepChildTextStateCopyWith<$Res> {
  __$$_OnboardingStepChildTextStateCopyWithImpl(
      _$_OnboardingStepChildTextState _value,
      $Res Function(_$_OnboardingStepChildTextState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? childCount = null,
  }) {
    return _then(_$_OnboardingStepChildTextState(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      childCount: null == childCount
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as ChildCountForm,
    ));
  }
}

/// @nodoc

class _$_OnboardingStepChildTextState implements _OnboardingStepChildTextState {
  const _$_OnboardingStepChildTextState(
      {this.formzStatus = FormzStatus.pure,
      this.childCount = const ChildCountForm.pure()});

  @override
  @JsonKey()
  final FormzStatus formzStatus;
  @override
  @JsonKey()
  final ChildCountForm childCount;

  @override
  String toString() {
    return 'OnboardingStepChildTextState(formzStatus: $formzStatus, childCount: $childCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingStepChildTextState &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.childCount, childCount) ||
                other.childCount == childCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, childCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStepChildTextStateCopyWith<_$_OnboardingStepChildTextState>
      get copyWith => __$$_OnboardingStepChildTextStateCopyWithImpl<
          _$_OnboardingStepChildTextState>(this, _$identity);
}

abstract class _OnboardingStepChildTextState
    implements OnboardingStepChildTextState {
  const factory _OnboardingStepChildTextState(
      {final FormzStatus formzStatus,
      final ChildCountForm childCount}) = _$_OnboardingStepChildTextState;

  @override
  FormzStatus get formzStatus;
  @override
  ChildCountForm get childCount;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStepChildTextStateCopyWith<_$_OnboardingStepChildTextState>
      get copyWith => throw _privateConstructorUsedError;
}
