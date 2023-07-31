// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_questionnare_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericQuestionnareState {
  StatusCubit get status => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;
  String? get currentQuestionId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericQuestionnareStateCopyWith<GenericQuestionnareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericQuestionnareStateCopyWith<$Res> {
  factory $GenericQuestionnareStateCopyWith(GenericQuestionnareState value,
          $Res Function(GenericQuestionnareState) then) =
      _$GenericQuestionnareStateCopyWithImpl<$Res, GenericQuestionnareState>;
  @useResult
  $Res call({StatusCubit status, int currentStep, String? currentQuestionId});
}

/// @nodoc
class _$GenericQuestionnareStateCopyWithImpl<$Res,
        $Val extends GenericQuestionnareState>
    implements $GenericQuestionnareStateCopyWith<$Res> {
  _$GenericQuestionnareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentStep = null,
    Object? currentQuestionId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuestionId: freezed == currentQuestionId
          ? _value.currentQuestionId
          : currentQuestionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericQuestionnareStateCopyWith<$Res>
    implements $GenericQuestionnareStateCopyWith<$Res> {
  factory _$$_GenericQuestionnareStateCopyWith(
          _$_GenericQuestionnareState value,
          $Res Function(_$_GenericQuestionnareState) then) =
      __$$_GenericQuestionnareStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StatusCubit status, int currentStep, String? currentQuestionId});
}

/// @nodoc
class __$$_GenericQuestionnareStateCopyWithImpl<$Res>
    extends _$GenericQuestionnareStateCopyWithImpl<$Res,
        _$_GenericQuestionnareState>
    implements _$$_GenericQuestionnareStateCopyWith<$Res> {
  __$$_GenericQuestionnareStateCopyWithImpl(_$_GenericQuestionnareState _value,
      $Res Function(_$_GenericQuestionnareState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentStep = null,
    Object? currentQuestionId = freezed,
  }) {
    return _then(_$_GenericQuestionnareState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuestionId: freezed == currentQuestionId
          ? _value.currentQuestionId
          : currentQuestionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GenericQuestionnareState implements _GenericQuestionnareState {
  const _$_GenericQuestionnareState(
      {this.status = StatusCubit.INITIAL,
      this.currentStep = 0,
      this.currentQuestionId});

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  @JsonKey()
  final int currentStep;
  @override
  final String? currentQuestionId;

  @override
  String toString() {
    return 'GenericQuestionnareState(status: $status, currentStep: $currentStep, currentQuestionId: $currentQuestionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericQuestionnareState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.currentQuestionId, currentQuestionId) ||
                other.currentQuestionId == currentQuestionId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, currentStep, currentQuestionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericQuestionnareStateCopyWith<_$_GenericQuestionnareState>
      get copyWith => __$$_GenericQuestionnareStateCopyWithImpl<
          _$_GenericQuestionnareState>(this, _$identity);
}

abstract class _GenericQuestionnareState implements GenericQuestionnareState {
  const factory _GenericQuestionnareState(
      {final StatusCubit status,
      final int currentStep,
      final String? currentQuestionId}) = _$_GenericQuestionnareState;

  @override
  StatusCubit get status;
  @override
  int get currentStep;
  @override
  String? get currentQuestionId;
  @override
  @JsonKey(ignore: true)
  _$$_GenericQuestionnareStateCopyWith<_$_GenericQuestionnareState>
      get copyWith => throw _privateConstructorUsedError;
}
