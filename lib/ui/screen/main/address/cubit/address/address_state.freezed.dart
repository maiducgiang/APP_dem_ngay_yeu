// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddressStateTearOff {
  const _$AddressStateTearOff();

  _AddressState call(
      {required bool isLoading,
      List<AddressDataResponse>? addressData,
      AddressDataResponse? selectAddress,
      bool? isUpdate,
      String? error}) {
    return _AddressState(
      isLoading: isLoading,
      addressData: addressData,
      selectAddress: selectAddress,
      isUpdate: isUpdate,
      error: error,
    );
  }
}

/// @nodoc
const $AddressState = _$AddressStateTearOff();

/// @nodoc
mixin _$AddressState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<AddressDataResponse>? get addressData =>
      throw _privateConstructorUsedError;
  AddressDataResponse? get selectAddress => throw _privateConstructorUsedError;
  bool? get isUpdate => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<AddressDataResponse>? addressData,
      AddressDataResponse? selectAddress,
      bool? isUpdate,
      String? error});
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res> implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  final AddressState _value;
  // ignore: unused_field
  final $Res Function(AddressState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? addressData = freezed,
    Object? selectAddress = freezed,
    Object? isUpdate = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addressData: addressData == freezed
          ? _value.addressData
          : addressData // ignore: cast_nullable_to_non_nullable
              as List<AddressDataResponse>?,
      selectAddress: selectAddress == freezed
          ? _value.selectAddress
          : selectAddress // ignore: cast_nullable_to_non_nullable
              as AddressDataResponse?,
      isUpdate: isUpdate == freezed
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddressStateCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$AddressStateCopyWith(
          _AddressState value, $Res Function(_AddressState) then) =
      __$AddressStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<AddressDataResponse>? addressData,
      AddressDataResponse? selectAddress,
      bool? isUpdate,
      String? error});
}

/// @nodoc
class __$AddressStateCopyWithImpl<$Res> extends _$AddressStateCopyWithImpl<$Res>
    implements _$AddressStateCopyWith<$Res> {
  __$AddressStateCopyWithImpl(
      _AddressState _value, $Res Function(_AddressState) _then)
      : super(_value, (v) => _then(v as _AddressState));

  @override
  _AddressState get _value => super._value as _AddressState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? addressData = freezed,
    Object? selectAddress = freezed,
    Object? isUpdate = freezed,
    Object? error = freezed,
  }) {
    return _then(_AddressState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      addressData: addressData == freezed
          ? _value.addressData
          : addressData // ignore: cast_nullable_to_non_nullable
              as List<AddressDataResponse>?,
      selectAddress: selectAddress == freezed
          ? _value.selectAddress
          : selectAddress // ignore: cast_nullable_to_non_nullable
              as AddressDataResponse?,
      isUpdate: isUpdate == freezed
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddressState implements _AddressState {
  const _$_AddressState(
      {required this.isLoading,
      this.addressData,
      this.selectAddress,
      this.isUpdate,
      this.error});

  @override
  final bool isLoading;
  @override
  final List<AddressDataResponse>? addressData;
  @override
  final AddressDataResponse? selectAddress;
  @override
  final bool? isUpdate;
  @override
  final String? error;

  @override
  String toString() {
    return 'AddressState(isLoading: $isLoading, addressData: $addressData, selectAddress: $selectAddress, isUpdate: $isUpdate, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.addressData, addressData) &&
            const DeepCollectionEquality()
                .equals(other.selectAddress, selectAddress) &&
            const DeepCollectionEquality().equals(other.isUpdate, isUpdate) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(addressData),
      const DeepCollectionEquality().hash(selectAddress),
      const DeepCollectionEquality().hash(isUpdate),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$AddressStateCopyWith<_AddressState> get copyWith =>
      __$AddressStateCopyWithImpl<_AddressState>(this, _$identity);
}

abstract class _AddressState implements AddressState {
  const factory _AddressState(
      {required bool isLoading,
      List<AddressDataResponse>? addressData,
      AddressDataResponse? selectAddress,
      bool? isUpdate,
      String? error}) = _$_AddressState;

  @override
  bool get isLoading;
  @override
  List<AddressDataResponse>? get addressData;
  @override
  AddressDataResponse? get selectAddress;
  @override
  bool? get isUpdate;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$AddressStateCopyWith<_AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}
