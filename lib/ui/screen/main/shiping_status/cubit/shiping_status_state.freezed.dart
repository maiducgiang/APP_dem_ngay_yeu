// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shiping_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShipingStatusStateTearOff {
  const _$ShipingStatusStateTearOff();

  _ShipingStatusState call(
      {required bool isLoading, String? error, ShipmentData? shipmentData}) {
    return _ShipingStatusState(
      isLoading: isLoading,
      error: error,
      shipmentData: shipmentData,
    );
  }
}

/// @nodoc
const $ShipingStatusState = _$ShipingStatusStateTearOff();

/// @nodoc
mixin _$ShipingStatusState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  ShipmentData? get shipmentData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipingStatusStateCopyWith<ShipingStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipingStatusStateCopyWith<$Res> {
  factory $ShipingStatusStateCopyWith(
          ShipingStatusState value, $Res Function(ShipingStatusState) then) =
      _$ShipingStatusStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String? error, ShipmentData? shipmentData});
}

/// @nodoc
class _$ShipingStatusStateCopyWithImpl<$Res>
    implements $ShipingStatusStateCopyWith<$Res> {
  _$ShipingStatusStateCopyWithImpl(this._value, this._then);

  final ShipingStatusState _value;
  // ignore: unused_field
  final $Res Function(ShipingStatusState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? shipmentData = freezed,
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
      shipmentData: shipmentData == freezed
          ? _value.shipmentData
          : shipmentData // ignore: cast_nullable_to_non_nullable
              as ShipmentData?,
    ));
  }
}

/// @nodoc
abstract class _$ShipingStatusStateCopyWith<$Res>
    implements $ShipingStatusStateCopyWith<$Res> {
  factory _$ShipingStatusStateCopyWith(
          _ShipingStatusState value, $Res Function(_ShipingStatusState) then) =
      __$ShipingStatusStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String? error, ShipmentData? shipmentData});
}

/// @nodoc
class __$ShipingStatusStateCopyWithImpl<$Res>
    extends _$ShipingStatusStateCopyWithImpl<$Res>
    implements _$ShipingStatusStateCopyWith<$Res> {
  __$ShipingStatusStateCopyWithImpl(
      _ShipingStatusState _value, $Res Function(_ShipingStatusState) _then)
      : super(_value, (v) => _then(v as _ShipingStatusState));

  @override
  _ShipingStatusState get _value => super._value as _ShipingStatusState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? shipmentData = freezed,
  }) {
    return _then(_ShipingStatusState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      shipmentData: shipmentData == freezed
          ? _value.shipmentData
          : shipmentData // ignore: cast_nullable_to_non_nullable
              as ShipmentData?,
    ));
  }
}

/// @nodoc

class _$_ShipingStatusState implements _ShipingStatusState {
  const _$_ShipingStatusState(
      {required this.isLoading, this.error, this.shipmentData});

  @override
  final bool isLoading;
  @override
  final String? error;
  @override
  final ShipmentData? shipmentData;

  @override
  String toString() {
    return 'ShipingStatusState(isLoading: $isLoading, error: $error, shipmentData: $shipmentData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShipingStatusState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.shipmentData, shipmentData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(shipmentData));

  @JsonKey(ignore: true)
  @override
  _$ShipingStatusStateCopyWith<_ShipingStatusState> get copyWith =>
      __$ShipingStatusStateCopyWithImpl<_ShipingStatusState>(this, _$identity);
}

abstract class _ShipingStatusState implements ShipingStatusState {
  const factory _ShipingStatusState(
      {required bool isLoading,
      String? error,
      ShipmentData? shipmentData}) = _$_ShipingStatusState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  ShipmentData? get shipmentData;
  @override
  @JsonKey(ignore: true)
  _$ShipingStatusStateCopyWith<_ShipingStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}
