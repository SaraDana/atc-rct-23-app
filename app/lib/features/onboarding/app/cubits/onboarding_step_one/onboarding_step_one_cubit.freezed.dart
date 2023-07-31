// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_one_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStepOneState {
  FormzStatus get formzStatus => throw _privateConstructorUsedError;
  FirstNameForm get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepOneStateCopyWith<OnboardingStepOneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepOneStateCopyWith<$Res> {
  factory $OnboardingStepOneStateCopyWith(OnboardingStepOneState value,
          $Res Function(OnboardingStepOneState) then) =
      _$OnboardingStepOneStateCopyWithImpl<$Res, OnboardingStepOneState>;
  @useResult
  $Res call({FormzStatus formzStatus, FirstNameForm name});
}

/// @nodoc
class _$OnboardingStepOneStateCopyWithImpl<$Res,
        $Val extends OnboardingStepOneState>
    implements $OnboardingStepOneStateCopyWith<$Res> {
  _$OnboardingStepOneStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FirstNameForm,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStepOneStateCopyWith<$Res>
    implements $OnboardingStepOneStateCopyWith<$Res> {
  factory _$$_OnboardingStepOneStateCopyWith(_$_OnboardingStepOneState value,
          $Res Function(_$_OnboardingStepOneState) then) =
      __$$_OnboardingStepOneStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus formzStatus, FirstNameForm name});
}

/// @nodoc
class __$$_OnboardingStepOneStateCopyWithImpl<$Res>
    extends _$OnboardingStepOneStateCopyWithImpl<$Res,
        _$_OnboardingStepOneState>
    implements _$$_OnboardingStepOneStateCopyWith<$Res> {
  __$$_OnboardingStepOneStateCopyWithImpl(_$_OnboardingStepOneState _value,
      $Res Function(_$_OnboardingStepOneState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? name = null,
  }) {
    return _then(_$_OnboardingStepOneState(
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FirstNameForm,
    ));
  }
}

/// @nodoc

class _$_OnboardingStepOneState implements _OnboardingStepOneState {
  const _$_OnboardingStepOneState(
      {this.formzStatus = FormzStatus.pure,
      this.name = const FirstNameForm.pure()});

  @override
  @JsonKey()
  final FormzStatus formzStatus;
  @override
  @JsonKey()
  final FirstNameForm name;

  @override
  String toString() {
    return 'OnboardingStepOneState(formzStatus: $formzStatus, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingStepOneState &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStepOneStateCopyWith<_$_OnboardingStepOneState> get copyWith =>
      __$$_OnboardingStepOneStateCopyWithImpl<_$_OnboardingStepOneState>(
          this, _$identity);
}

abstract class _OnboardingStepOneState implements OnboardingStepOneState {
  const factory _OnboardingStepOneState(
      {final FormzStatus formzStatus,
      final FirstNameForm name}) = _$_OnboardingStepOneState;

  @override
  FormzStatus get formzStatus;
  @override
  FirstNameForm get name;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStepOneStateCopyWith<_$_OnboardingStepOneState> get copyWith =>
      throw _privateConstructorUsedError;
}
