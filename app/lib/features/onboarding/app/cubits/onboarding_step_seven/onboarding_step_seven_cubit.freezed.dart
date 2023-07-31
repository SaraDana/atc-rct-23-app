// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_seven_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStepSevenState {
  List<InitialProfileContentType> get contentTypeList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStepSevenStateCopyWith<OnboardingStepSevenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStepSevenStateCopyWith<$Res> {
  factory $OnboardingStepSevenStateCopyWith(OnboardingStepSevenState value,
          $Res Function(OnboardingStepSevenState) then) =
      _$OnboardingStepSevenStateCopyWithImpl<$Res, OnboardingStepSevenState>;
  @useResult
  $Res call({List<InitialProfileContentType> contentTypeList});
}

/// @nodoc
class _$OnboardingStepSevenStateCopyWithImpl<$Res,
        $Val extends OnboardingStepSevenState>
    implements $OnboardingStepSevenStateCopyWith<$Res> {
  _$OnboardingStepSevenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentTypeList = null,
  }) {
    return _then(_value.copyWith(
      contentTypeList: null == contentTypeList
          ? _value.contentTypeList
          : contentTypeList // ignore: cast_nullable_to_non_nullable
              as List<InitialProfileContentType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStepSevenStateCopyWith<$Res>
    implements $OnboardingStepSevenStateCopyWith<$Res> {
  factory _$$_OnboardingStepSevenStateCopyWith(
          _$_OnboardingStepSevenState value,
          $Res Function(_$_OnboardingStepSevenState) then) =
      __$$_OnboardingStepSevenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InitialProfileContentType> contentTypeList});
}

/// @nodoc
class __$$_OnboardingStepSevenStateCopyWithImpl<$Res>
    extends _$OnboardingStepSevenStateCopyWithImpl<$Res,
        _$_OnboardingStepSevenState>
    implements _$$_OnboardingStepSevenStateCopyWith<$Res> {
  __$$_OnboardingStepSevenStateCopyWithImpl(_$_OnboardingStepSevenState _value,
      $Res Function(_$_OnboardingStepSevenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentTypeList = null,
  }) {
    return _then(_$_OnboardingStepSevenState(
      contentTypeList: null == contentTypeList
          ? _value._contentTypeList
          : contentTypeList // ignore: cast_nullable_to_non_nullable
              as List<InitialProfileContentType>,
    ));
  }
}

/// @nodoc

class _$_OnboardingStepSevenState implements _OnboardingStepSevenState {
  const _$_OnboardingStepSevenState(
      {final List<InitialProfileContentType> contentTypeList = const []})
      : _contentTypeList = contentTypeList;

  final List<InitialProfileContentType> _contentTypeList;
  @override
  @JsonKey()
  List<InitialProfileContentType> get contentTypeList {
    if (_contentTypeList is EqualUnmodifiableListView) return _contentTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contentTypeList);
  }

  @override
  String toString() {
    return 'OnboardingStepSevenState(contentTypeList: $contentTypeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingStepSevenState &&
            const DeepCollectionEquality()
                .equals(other._contentTypeList, _contentTypeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_contentTypeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStepSevenStateCopyWith<_$_OnboardingStepSevenState>
      get copyWith => __$$_OnboardingStepSevenStateCopyWithImpl<
          _$_OnboardingStepSevenState>(this, _$identity);
}

abstract class _OnboardingStepSevenState implements OnboardingStepSevenState {
  const factory _OnboardingStepSevenState(
          {final List<InitialProfileContentType> contentTypeList}) =
      _$_OnboardingStepSevenState;

  @override
  List<InitialProfileContentType> get contentTypeList;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStepSevenStateCopyWith<_$_OnboardingStepSevenState>
      get copyWith => throw _privateConstructorUsedError;
}
