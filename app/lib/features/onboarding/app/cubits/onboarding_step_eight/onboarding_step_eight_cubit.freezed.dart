// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_eight_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStepEightState {
  List<InitialProfileHelp> get contentHelpList =>
      throw _privateConstructorUsedError;
  int get maxSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepEightStateCopyWith<OnboardingStepEightState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepEightStateCopyWith<$Res> {
  factory $OnboardingStepEightStateCopyWith(OnboardingStepEightState value,
          $Res Function(OnboardingStepEightState) then) =
      _$OnboardingStepEightStateCopyWithImpl<$Res, OnboardingStepEightState>;
  @useResult
  $Res call({List<InitialProfileHelp> contentHelpList, int maxSelected});
}

/// @nodoc
class _$OnboardingStepEightStateCopyWithImpl<$Res,
        $Val extends OnboardingStepEightState>
    implements $OnboardingStepEightStateCopyWith<$Res> {
  _$OnboardingStepEightStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentHelpList = null,
    Object? maxSelected = null,
  }) {
    return _then(_value.copyWith(
      contentHelpList: null == contentHelpList
          ? _value.contentHelpList
          : contentHelpList // ignore: cast_nullable_to_non_nullable
              as List<InitialProfileHelp>,
      maxSelected: null == maxSelected
          ? _value.maxSelected
          : maxSelected // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStepEightStateCopyWith<$Res>
    implements $OnboardingStepEightStateCopyWith<$Res> {
  factory _$$_OnboardingStepEightStateCopyWith(
          _$_OnboardingStepEightState value,
          $Res Function(_$_OnboardingStepEightState) then) =
      __$$_OnboardingStepEightStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InitialProfileHelp> contentHelpList, int maxSelected});
}

/// @nodoc
class __$$_OnboardingStepEightStateCopyWithImpl<$Res>
    extends _$OnboardingStepEightStateCopyWithImpl<$Res,
        _$_OnboardingStepEightState>
    implements _$$_OnboardingStepEightStateCopyWith<$Res> {
  __$$_OnboardingStepEightStateCopyWithImpl(_$_OnboardingStepEightState _value,
      $Res Function(_$_OnboardingStepEightState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentHelpList = null,
    Object? maxSelected = null,
  }) {
    return _then(_$_OnboardingStepEightState(
      contentHelpList: null == contentHelpList
          ? _value._contentHelpList
          : contentHelpList // ignore: cast_nullable_to_non_nullable
              as List<InitialProfileHelp>,
      maxSelected: null == maxSelected
          ? _value.maxSelected
          : maxSelected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnboardingStepEightState implements _OnboardingStepEightState {
  const _$_OnboardingStepEightState(
      {final List<InitialProfileHelp> contentHelpList = const [],
      this.maxSelected = 3})
      : _contentHelpList = contentHelpList;

  final List<InitialProfileHelp> _contentHelpList;
  @override
  @JsonKey()
  List<InitialProfileHelp> get contentHelpList {
    if (_contentHelpList is EqualUnmodifiableListView) return _contentHelpList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentHelpList);
  }

  @override
  @JsonKey()
  final int maxSelected;

  @override
  String toString() {
    return 'OnboardingStepEightState(contentHelpList: $contentHelpList, maxSelected: $maxSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingStepEightState &&
            const DeepCollectionEquality()
                .equals(other._contentHelpList, _contentHelpList) &&
            (identical(other.maxSelected, maxSelected) ||
                other.maxSelected == maxSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contentHelpList), maxSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStepEightStateCopyWith<_$_OnboardingStepEightState>
      get copyWith => __$$_OnboardingStepEightStateCopyWithImpl<
          _$_OnboardingStepEightState>(this, _$identity);
}

abstract class _OnboardingStepEightState implements OnboardingStepEightState {
  const factory _OnboardingStepEightState(
      {final List<InitialProfileHelp> contentHelpList,
      final int maxSelected}) = _$_OnboardingStepEightState;

  @override
  List<InitialProfileHelp> get contentHelpList;
  @override
  int get maxSelected;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStepEightStateCopyWith<_$_OnboardingStepEightState>
      get copyWith => throw _privateConstructorUsedError;
}
