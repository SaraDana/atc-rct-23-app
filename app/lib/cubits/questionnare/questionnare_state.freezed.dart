// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnare_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionnareState {
  StatusCubit get status => throw _privateConstructorUsedError;
  bool get saveButtonIsActive => throw _privateConstructorUsedError;
  bool get questionnareComplated => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  QuestionnairesModel? get questionnaire => throw _privateConstructorUsedError;
  List<QuestionStatementModel>? get statements =>
      throw _privateConstructorUsedError;
  QuestionareEnum? get questionnareEnum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionnareStateCopyWith<QuestionnareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnareStateCopyWith<$Res> {
  factory $QuestionnareStateCopyWith(
          QuestionnareState value, $Res Function(QuestionnareState) then) =
      _$QuestionnareStateCopyWithImpl<$Res, QuestionnareState>;
  @useResult
  $Res call(
      {StatusCubit status,
      bool saveButtonIsActive,
      bool questionnareComplated,
      String? errorMessage,
      QuestionnairesModel? questionnaire,
      List<QuestionStatementModel>? statements,
      QuestionareEnum? questionnareEnum});
}

/// @nodoc
class _$QuestionnareStateCopyWithImpl<$Res, $Val extends QuestionnareState>
    implements $QuestionnareStateCopyWith<$Res> {
  _$QuestionnareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? saveButtonIsActive = null,
    Object? questionnareComplated = null,
    Object? errorMessage = freezed,
    Object? questionnaire = freezed,
    Object? statements = freezed,
    Object? questionnareEnum = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      saveButtonIsActive: null == saveButtonIsActive
          ? _value.saveButtonIsActive
          : saveButtonIsActive // ignore: cast_nullable_to_non_nullable
              as bool,
      questionnareComplated: null == questionnareComplated
          ? _value.questionnareComplated
          : questionnareComplated // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnairesModel?,
      statements: freezed == statements
          ? _value.statements
          : statements // ignore: cast_nullable_to_non_nullable
              as List<QuestionStatementModel>?,
      questionnareEnum: freezed == questionnareEnum
          ? _value.questionnareEnum
          : questionnareEnum // ignore: cast_nullable_to_non_nullable
              as QuestionareEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionnareStateCopyWith<$Res>
    implements $QuestionnareStateCopyWith<$Res> {
  factory _$$_QuestionnareStateCopyWith(_$_QuestionnareState value,
          $Res Function(_$_QuestionnareState) then) =
      __$$_QuestionnareStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusCubit status,
      bool saveButtonIsActive,
      bool questionnareComplated,
      String? errorMessage,
      QuestionnairesModel? questionnaire,
      List<QuestionStatementModel>? statements,
      QuestionareEnum? questionnareEnum});
}

/// @nodoc
class __$$_QuestionnareStateCopyWithImpl<$Res>
    extends _$QuestionnareStateCopyWithImpl<$Res, _$_QuestionnareState>
    implements _$$_QuestionnareStateCopyWith<$Res> {
  __$$_QuestionnareStateCopyWithImpl(
      _$_QuestionnareState _value, $Res Function(_$_QuestionnareState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? saveButtonIsActive = null,
    Object? questionnareComplated = null,
    Object? errorMessage = freezed,
    Object? questionnaire = freezed,
    Object? statements = freezed,
    Object? questionnareEnum = freezed,
  }) {
    return _then(_$_QuestionnareState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCubit,
      saveButtonIsActive: null == saveButtonIsActive
          ? _value.saveButtonIsActive
          : saveButtonIsActive // ignore: cast_nullable_to_non_nullable
              as bool,
      questionnareComplated: null == questionnareComplated
          ? _value.questionnareComplated
          : questionnareComplated // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as QuestionnairesModel?,
      statements: freezed == statements
          ? _value._statements
          : statements // ignore: cast_nullable_to_non_nullable
              as List<QuestionStatementModel>?,
      questionnareEnum: freezed == questionnareEnum
          ? _value.questionnareEnum
          : questionnareEnum // ignore: cast_nullable_to_non_nullable
              as QuestionareEnum?,
    ));
  }
}

/// @nodoc

class _$_QuestionnareState implements _QuestionnareState {
  const _$_QuestionnareState(
      {this.status = StatusCubit.INITIAL,
      this.saveButtonIsActive = false,
      this.questionnareComplated = false,
      this.errorMessage,
      this.questionnaire,
      final List<QuestionStatementModel>? statements,
      this.questionnareEnum})
      : _statements = statements;

  @override
  @JsonKey()
  final StatusCubit status;
  @override
  @JsonKey()
  final bool saveButtonIsActive;
  @override
  @JsonKey()
  final bool questionnareComplated;
  @override
  final String? errorMessage;
  @override
  final QuestionnairesModel? questionnaire;
  final List<QuestionStatementModel>? _statements;
  @override
  List<QuestionStatementModel>? get statements {
    final value = _statements;
    if (value == null) return null;
    if (_statements is EqualUnmodifiableListView) return _statements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final QuestionareEnum? questionnareEnum;

  @override
  String toString() {
    return 'QuestionnareState(status: $status, saveButtonIsActive: $saveButtonIsActive, questionnareComplated: $questionnareComplated, errorMessage: $errorMessage, questionnaire: $questionnaire, statements: $statements, questionnareEnum: $questionnareEnum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionnareState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.saveButtonIsActive, saveButtonIsActive) ||
                other.saveButtonIsActive == saveButtonIsActive) &&
            (identical(other.questionnareComplated, questionnareComplated) ||
                other.questionnareComplated == questionnareComplated) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.questionnaire, questionnaire) ||
                other.questionnaire == questionnaire) &&
            const DeepCollectionEquality()
                .equals(other._statements, _statements) &&
            (identical(other.questionnareEnum, questionnareEnum) ||
                other.questionnareEnum == questionnareEnum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      saveButtonIsActive,
      questionnareComplated,
      errorMessage,
      questionnaire,
      const DeepCollectionEquality().hash(_statements),
      questionnareEnum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnareStateCopyWith<_$_QuestionnareState> get copyWith =>
      __$$_QuestionnareStateCopyWithImpl<_$_QuestionnareState>(
          this, _$identity);
}

abstract class _QuestionnareState implements QuestionnareState {
  const factory _QuestionnareState(
      {final StatusCubit status,
      final bool saveButtonIsActive,
      final bool questionnareComplated,
      final String? errorMessage,
      final QuestionnairesModel? questionnaire,
      final List<QuestionStatementModel>? statements,
      final QuestionareEnum? questionnareEnum}) = _$_QuestionnareState;

  @override
  StatusCubit get status;
  @override
  bool get saveButtonIsActive;
  @override
  bool get questionnareComplated;
  @override
  String? get errorMessage;
  @override
  QuestionnairesModel? get questionnaire;
  @override
  List<QuestionStatementModel>? get statements;
  @override
  QuestionareEnum? get questionnareEnum;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnareStateCopyWith<_$_QuestionnareState> get copyWith =>
      throw _privateConstructorUsedError;
}
