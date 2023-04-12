// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoriteStateTearOff {
  const _$FavoriteStateTearOff();

  _FavoriteState call(
      {required bool isLoading,
      required List<Product> listFavorite,
      String? message,
      String? error}) {
    return _FavoriteState(
      isLoading: isLoading,
      listFavorite: listFavorite,
      message: message,
      error: error,
    );
  }
}

/// @nodoc
const $FavoriteState = _$FavoriteStateTearOff();

/// @nodoc
mixin _$FavoriteState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Product> get listFavorite => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<Product> listFavorite,
      String? message,
      String? error});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  final FavoriteState _value;
  // ignore: unused_field
  final $Res Function(FavoriteState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? listFavorite = freezed,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listFavorite: listFavorite == freezed
          ? _value.listFavorite
          : listFavorite // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FavoriteStateCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$FavoriteStateCopyWith(
          _FavoriteState value, $Res Function(_FavoriteState) then) =
      __$FavoriteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<Product> listFavorite,
      String? message,
      String? error});
}

/// @nodoc
class __$FavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res>
    implements _$FavoriteStateCopyWith<$Res> {
  __$FavoriteStateCopyWithImpl(
      _FavoriteState _value, $Res Function(_FavoriteState) _then)
      : super(_value, (v) => _then(v as _FavoriteState));

  @override
  _FavoriteState get _value => super._value as _FavoriteState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? listFavorite = freezed,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_FavoriteState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      listFavorite: listFavorite == freezed
          ? _value.listFavorite
          : listFavorite // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FavoriteState implements _FavoriteState {
  const _$_FavoriteState(
      {required this.isLoading,
      required this.listFavorite,
      this.message,
      this.error});

  @override
  final bool isLoading;
  @override
  final List<Product> listFavorite;
  @override
  final String? message;
  @override
  final String? error;

  @override
  String toString() {
    return 'FavoriteState(isLoading: $isLoading, listFavorite: $listFavorite, message: $message, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.listFavorite, listFavorite) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(listFavorite),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$FavoriteStateCopyWith<_FavoriteState> get copyWith =>
      __$FavoriteStateCopyWithImpl<_FavoriteState>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {required bool isLoading,
      required List<Product> listFavorite,
      String? message,
      String? error}) = _$_FavoriteState;

  @override
  bool get isLoading;
  @override
  List<Product> get listFavorite;
  @override
  String? get message;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$FavoriteStateCopyWith<_FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
