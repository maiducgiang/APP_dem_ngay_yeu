// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatusOrderStateTearOff {
  const _$StatusOrderStateTearOff();

  _StatusOrderState call(
      {required bool isLoading,
      String? error,
      OrderData? orderData,
      OrderDocs? orderDocs}) {
    return _StatusOrderState(
      isLoading: isLoading,
      error: error,
      orderData: orderData,
      orderDocs: orderDocs,
    );
  }
}

/// @nodoc
const $StatusOrderState = _$StatusOrderStateTearOff();

/// @nodoc
mixin _$StatusOrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  OrderData? get orderData => throw _privateConstructorUsedError;
  OrderDocs? get orderDocs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusOrderStateCopyWith<StatusOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusOrderStateCopyWith<$Res> {
  factory $StatusOrderStateCopyWith(
          StatusOrderState value, $Res Function(StatusOrderState) then) =
      _$StatusOrderStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String? error,
      OrderData? orderData,
      OrderDocs? orderDocs});
}

/// @nodoc
class _$StatusOrderStateCopyWithImpl<$Res>
    implements $StatusOrderStateCopyWith<$Res> {
  _$StatusOrderStateCopyWithImpl(this._value, this._then);

  final StatusOrderState _value;
  // ignore: unused_field
  final $Res Function(StatusOrderState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? orderData = freezed,
    Object? orderDocs = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      orderData: orderData == freezed
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      orderDocs: orderDocs == freezed
          ? _value.orderDocs
          : orderDocs // ignore: cast_nullable_to_non_nullable
              as OrderDocs?,
    ));
  }
}

/// @nodoc
abstract class _$StatusOrderStateCopyWith<$Res>
    implements $StatusOrderStateCopyWith<$Res> {
  factory _$StatusOrderStateCopyWith(
          _StatusOrderState value, $Res Function(_StatusOrderState) then) =
      __$StatusOrderStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String? error,
      OrderData? orderData,
      OrderDocs? orderDocs});
}

/// @nodoc
class __$StatusOrderStateCopyWithImpl<$Res>
    extends _$StatusOrderStateCopyWithImpl<$Res>
    implements _$StatusOrderStateCopyWith<$Res> {
  __$StatusOrderStateCopyWithImpl(
      _StatusOrderState _value, $Res Function(_StatusOrderState) _then)
      : super(_value, (v) => _then(v as _StatusOrderState));

  @override
  _StatusOrderState get _value => super._value as _StatusOrderState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? orderData = freezed,
    Object? orderDocs = freezed,
  }) {
    return _then(_StatusOrderState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      orderData: orderData == freezed
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      orderDocs: orderDocs == freezed
          ? _value.orderDocs
          : orderDocs // ignore: cast_nullable_to_non_nullable
              as OrderDocs?,
    ));
  }
}

/// @nodoc

class _$_StatusOrderState implements _StatusOrderState {
  const _$_StatusOrderState(
      {required this.isLoading, this.error, this.orderData, this.orderDocs});

  @override
  final bool isLoading;
  @override
  final String? error;
  @override
  final OrderData? orderData;
  @override
  final OrderDocs? orderDocs;

  @override
  String toString() {
    return 'StatusOrderState(isLoading: $isLoading, error: $error, orderData: $orderData, orderDocs: $orderDocs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatusOrderState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.orderData, orderData) &&
            const DeepCollectionEquality().equals(other.orderDocs, orderDocs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(orderData),
      const DeepCollectionEquality().hash(orderDocs));

  @JsonKey(ignore: true)
  @override
  _$StatusOrderStateCopyWith<_StatusOrderState> get copyWith =>
      __$StatusOrderStateCopyWithImpl<_StatusOrderState>(this, _$identity);
}

abstract class _StatusOrderState implements StatusOrderState {
  const factory _StatusOrderState(
      {required bool isLoading,
      String? error,
      OrderData? orderData,
      OrderDocs? orderDocs}) = _$_StatusOrderState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  OrderData? get orderData;
  @override
  OrderDocs? get orderDocs;
  @override
  @JsonKey(ignore: true)
  _$StatusOrderStateCopyWith<_StatusOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
