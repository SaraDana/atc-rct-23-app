// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasesState {
  bool get fullPremium => throw _privateConstructorUsedError;
  PurchaseStatus get purchasesStatus => throw _privateConstructorUsedError;
  PurchasableProduct? get selectProduct => throw _privateConstructorUsedError;
  List<PurchasableProduct> get products => throw _privateConstructorUsedError;
  bool get unlockProgram => throw _privateConstructorUsedError;
  List<Payment> get historyPayments => throw _privateConstructorUsedError;
  String get dateToExpire => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasesStateCopyWith<PurchasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesStateCopyWith<$Res> {
  factory $PurchasesStateCopyWith(
          PurchasesState value, $Res Function(PurchasesState) then) =
      _$PurchasesStateCopyWithImpl<$Res, PurchasesState>;
  @useResult
  $Res call(
      {bool fullPremium,
      PurchaseStatus purchasesStatus,
      PurchasableProduct? selectProduct,
      List<PurchasableProduct> products,
      bool unlockProgram,
      List<Payment> historyPayments,
      String dateToExpire});
}

/// @nodoc
class _$PurchasesStateCopyWithImpl<$Res, $Val extends PurchasesState>
    implements $PurchasesStateCopyWith<$Res> {
  _$PurchasesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullPremium = null,
    Object? purchasesStatus = null,
    Object? selectProduct = freezed,
    Object? products = null,
    Object? unlockProgram = null,
    Object? historyPayments = null,
    Object? dateToExpire = null,
  }) {
    return _then(_value.copyWith(
      fullPremium: null == fullPremium
          ? _value.fullPremium
          : fullPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasesStatus: null == purchasesStatus
          ? _value.purchasesStatus
          : purchasesStatus // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      selectProduct: freezed == selectProduct
          ? _value.selectProduct
          : selectProduct // ignore: cast_nullable_to_non_nullable
              as PurchasableProduct?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PurchasableProduct>,
      unlockProgram: null == unlockProgram
          ? _value.unlockProgram
          : unlockProgram // ignore: cast_nullable_to_non_nullable
              as bool,
      historyPayments: null == historyPayments
          ? _value.historyPayments
          : historyPayments // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      dateToExpire: null == dateToExpire
          ? _value.dateToExpire
          : dateToExpire // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasesStateCopyWith<$Res>
    implements $PurchasesStateCopyWith<$Res> {
  factory _$$_PurchasesStateCopyWith(
          _$_PurchasesState value, $Res Function(_$_PurchasesState) then) =
      __$$_PurchasesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool fullPremium,
      PurchaseStatus purchasesStatus,
      PurchasableProduct? selectProduct,
      List<PurchasableProduct> products,
      bool unlockProgram,
      List<Payment> historyPayments,
      String dateToExpire});
}

/// @nodoc
class __$$_PurchasesStateCopyWithImpl<$Res>
    extends _$PurchasesStateCopyWithImpl<$Res, _$_PurchasesState>
    implements _$$_PurchasesStateCopyWith<$Res> {
  __$$_PurchasesStateCopyWithImpl(
      _$_PurchasesState _value, $Res Function(_$_PurchasesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullPremium = null,
    Object? purchasesStatus = null,
    Object? selectProduct = freezed,
    Object? products = null,
    Object? unlockProgram = null,
    Object? historyPayments = null,
    Object? dateToExpire = null,
  }) {
    return _then(_$_PurchasesState(
      fullPremium: null == fullPremium
          ? _value.fullPremium
          : fullPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasesStatus: null == purchasesStatus
          ? _value.purchasesStatus
          : purchasesStatus // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      selectProduct: freezed == selectProduct
          ? _value.selectProduct
          : selectProduct // ignore: cast_nullable_to_non_nullable
              as PurchasableProduct?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PurchasableProduct>,
      unlockProgram: null == unlockProgram
          ? _value.unlockProgram
          : unlockProgram // ignore: cast_nullable_to_non_nullable
              as bool,
      historyPayments: null == historyPayments
          ? _value._historyPayments
          : historyPayments // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      dateToExpire: null == dateToExpire
          ? _value.dateToExpire
          : dateToExpire // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PurchasesState implements _PurchasesState {
  const _$_PurchasesState(
      {this.fullPremium = false,
      this.purchasesStatus = PurchaseStatus.initial,
      this.selectProduct,
      final List<PurchasableProduct> products = const [],
      this.unlockProgram = false,
      final List<Payment> historyPayments = const [],
      this.dateToExpire = ''})
      : _products = products,
        _historyPayments = historyPayments;

  @override
  @JsonKey()
  final bool fullPremium;
  @override
  @JsonKey()
  final PurchaseStatus purchasesStatus;
  @override
  final PurchasableProduct? selectProduct;
  final List<PurchasableProduct> _products;
  @override
  @JsonKey()
  List<PurchasableProduct> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final bool unlockProgram;
  final List<Payment> _historyPayments;
  @override
  @JsonKey()
  List<Payment> get historyPayments {
    if (_historyPayments is EqualUnmodifiableListView) return _historyPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyPayments);
  }

  @override
  @JsonKey()
  final String dateToExpire;

  @override
  String toString() {
    return 'PurchasesState(fullPremium: $fullPremium, purchasesStatus: $purchasesStatus, selectProduct: $selectProduct, products: $products, unlockProgram: $unlockProgram, historyPayments: $historyPayments, dateToExpire: $dateToExpire)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesState &&
            (identical(other.fullPremium, fullPremium) ||
                other.fullPremium == fullPremium) &&
            (identical(other.purchasesStatus, purchasesStatus) ||
                other.purchasesStatus == purchasesStatus) &&
            (identical(other.selectProduct, selectProduct) ||
                other.selectProduct == selectProduct) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.unlockProgram, unlockProgram) ||
                other.unlockProgram == unlockProgram) &&
            const DeepCollectionEquality()
                .equals(other._historyPayments, _historyPayments) &&
            (identical(other.dateToExpire, dateToExpire) ||
                other.dateToExpire == dateToExpire));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullPremium,
      purchasesStatus,
      selectProduct,
      const DeepCollectionEquality().hash(_products),
      unlockProgram,
      const DeepCollectionEquality().hash(_historyPayments),
      dateToExpire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasesStateCopyWith<_$_PurchasesState> get copyWith =>
      __$$_PurchasesStateCopyWithImpl<_$_PurchasesState>(this, _$identity);
}

abstract class _PurchasesState implements PurchasesState {
  const factory _PurchasesState(
      {final bool fullPremium,
      final PurchaseStatus purchasesStatus,
      final PurchasableProduct? selectProduct,
      final List<PurchasableProduct> products,
      final bool unlockProgram,
      final List<Payment> historyPayments,
      final String dateToExpire}) = _$_PurchasesState;

  @override
  bool get fullPremium;
  @override
  PurchaseStatus get purchasesStatus;
  @override
  PurchasableProduct? get selectProduct;
  @override
  List<PurchasableProduct> get products;
  @override
  bool get unlockProgram;
  @override
  List<Payment> get historyPayments;
  @override
  String get dateToExpire;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasesStateCopyWith<_$_PurchasesState> get copyWith =>
      throw _privateConstructorUsedError;
}
