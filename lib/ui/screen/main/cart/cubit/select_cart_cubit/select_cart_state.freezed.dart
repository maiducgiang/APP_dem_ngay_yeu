// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'select_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SelectCartStateTearOff {
  const _$SelectCartStateTearOff();

  _SelectCartState call({required List<String> idList}) {
    return _SelectCartState(
      idList: idList,
    );
  }
}

/// @nodoc
const $SelectCartState = _$SelectCartStateTearOff();

/// @nodoc
mixin _$SelectCartState {
  List<String> get idList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectCartStateCopyWith<SelectCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectCartStateCopyWith<$Res> {
  factory $SelectCartStateCopyWith(
          SelectCartState value, $Res Function(SelectCartState) then) =
      _$SelectCartStateCopyWithImpl<$Res>;
  $Res call({List<String> idList});
}

/// @nodoc
class _$SelectCartStateCopyWithImpl<$Res>
    implements $SelectCartStateCopyWith<$Res> {
  _$SelectCartStateCopyWithImpl(this._value, this._then);

  final SelectCartState _value;
  // ignore: unused_field
  final $Res Function(SelectCartState) _then;

  @override
  $Res call({
    Object? idList = freezed,
  }) {
    return _then(_value.copyWith(
      idList: idList == freezed
          ? _value.idList
          : idList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SelectCartStateCopyWith<$Res>
    implements $SelectCartStateCopyWith<$Res> {
  factory _$SelectCartStateCopyWith(
          _SelectCartState value, $Res Function(_SelectCartState) then) =
      __$SelectCartStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> idList});
}

/// @nodoc
class __$SelectCartStateCopyWithImpl<$Res>
    extends _$SelectCartStateCopyWithImpl<$Res>
    implements _$SelectCartStateCopyWith<$Res> {
  __$SelectCartStateCopyWithImpl(
      _SelectCartState _value, $Res Function(_SelectCartState) _then)
      : super(_value, (v) => _then(v as _SelectCartState));

  @override
  _SelectCartState get _value => super._value as _SelectCartState;

  @override
  $Res call({
    Object? idList = freezed,
  }) {
    return _then(_SelectCartState(
      idList: idList == freezed
          ? _value.idList
          : idList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SelectCartState implements _SelectCartState {
  const _$_SelectCartState({required this.idList});

  @override
  final List<String> idList;

  @override
  String toString() {
    return 'SelectCartState(idList: $idList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectCartState &&
            const DeepCollectionEquality().equals(other.idList, idList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(idList));

  @JsonKey(ignore: true)
  @override
  _$SelectCartStateCopyWith<_SelectCartState> get copyWith =>
      __$SelectCartStateCopyWithImpl<_SelectCartState>(this, _$identity);
}

abstract class _SelectCartState implements SelectCartState {
  const factory _SelectCartState({required List<String> idList}) =
      _$_SelectCartState;

  @override
  List<String> get idList;
  @override
  @JsonKey(ignore: true)
  _$SelectCartStateCopyWith<_SelectCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
