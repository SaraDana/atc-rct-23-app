// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PremiumSelection _$PremiumSelectionFromJson(Map<String, dynamic> json) {
  return _PremiumSelection.fromJson(json);
}

/// @nodoc
mixin _$PremiumSelection {
  String get unlockId => throw _privateConstructorUsedError;
  String get programId => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PremiumSelectionCopyWith<PremiumSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumSelectionCopyWith<$Res> {
  factory $PremiumSelectionCopyWith(
          PremiumSelection value, $Res Function(PremiumSelection) then) =
      _$PremiumSelectionCopyWithImpl<$Res, PremiumSelection>;
  @useResult
  $Res call(
      {String unlockId,
      String programId,
      String paymentId,
      DateTime purchaseDate,
      DateTime? expiryDate});
}

/// @nodoc
class _$PremiumSelectionCopyWithImpl<$Res, $Val extends PremiumSelection>
    implements $PremiumSelectionCopyWith<$Res> {
  _$PremiumSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unlockId = null,
    Object? programId = null,
    Object? paymentId = null,
    Object? purchaseDate = null,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      unlockId: null == unlockId
          ? _value.unlockId
          : unlockId // ignore: cast_nullable_to_non_nullable
              as String,
      programId: null == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PremiumSelectionCopyWith<$Res>
    implements $PremiumSelectionCopyWith<$Res> {
  factory _$$_PremiumSelectionCopyWith(
          _$_PremiumSelection value, $Res Function(_$_PremiumSelection) then) =
      __$$_PremiumSelectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String unlockId,
      String programId,
      String paymentId,
      DateTime purchaseDate,
      DateTime? expiryDate});
}

/// @nodoc
class __$$_PremiumSelectionCopyWithImpl<$Res>
    extends _$PremiumSelectionCopyWithImpl<$Res, _$_PremiumSelection>
    implements _$$_PremiumSelectionCopyWith<$Res> {
  __$$_PremiumSelectionCopyWithImpl(
      _$_PremiumSelection _value, $Res Function(_$_PremiumSelection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unlockId = null,
    Object? programId = null,
    Object? paymentId = null,
    Object? purchaseDate = null,
    Object? expiryDate = freezed,
  }) {
    return _then(_$_PremiumSelection(
      unlockId: null == unlockId
          ? _value.unlockId
          : unlockId // ignore: cast_nullable_to_non_nullable
              as String,
      programId: null == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PremiumSelection implements _PremiumSelection {
  const _$_PremiumSelection(
      {required this.unlockId,
      required this.programId,
      required this.paymentId,
      required this.purchaseDate,
      this.expiryDate});

  factory _$_PremiumSelection.fromJson(Map<String, dynamic> json) =>
      _$$_PremiumSelectionFromJson(json);

  @override
  final String unlockId;
  @override
  final String programId;
  @override
  final String paymentId;
  @override
  final DateTime purchaseDate;
  @override
  final DateTime? expiryDate;

  @override
  String toString() {
    return 'PremiumSelection(unlockId: $unlockId, programId: $programId, paymentId: $paymentId, purchaseDate: $purchaseDate, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PremiumSelection &&
            (identical(other.unlockId, unlockId) ||
                other.unlockId == unlockId) &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, unlockId, programId, paymentId, purchaseDate, expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PremiumSelectionCopyWith<_$_PremiumSelection> get copyWith =>
      __$$_PremiumSelectionCopyWithImpl<_$_PremiumSelection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PremiumSelectionToJson(
      this,
    );
  }
}

abstract class _PremiumSelection implements PremiumSelection {
  const factory _PremiumSelection(
      {required final String unlockId,
      required final String programId,
      required final String paymentId,
      required final DateTime purchaseDate,
      final DateTime? expiryDate}) = _$_PremiumSelection;

  factory _PremiumSelection.fromJson(Map<String, dynamic> json) =
      _$_PremiumSelection.fromJson;

  @override
  String get unlockId;
  @override
  String get programId;
  @override
  String get paymentId;
  @override
  DateTime get purchaseDate;
  @override
  DateTime? get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$_PremiumSelectionCopyWith<_$_PremiumSelection> get copyWith =>
      throw _privateConstructorUsedError;
}
