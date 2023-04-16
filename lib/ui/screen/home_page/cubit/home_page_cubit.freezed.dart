// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageState {
  bool? get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get editing => throw _privateConstructorUsedError;
  HomeModel? get homeModel => throw _privateConstructorUsedError;
  User? get me => throw _privateConstructorUsedError;
  User? get myLover => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {bool? isLoading,
      String? error,
      bool editing,
      HomeModel? homeModel,
      User? me,
      User? myLover});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? editing = null,
    Object? homeModel = freezed,
    Object? me = freezed,
    Object? myLover = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      editing: null == editing
          ? _value.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as bool,
      homeModel: freezed == homeModel
          ? _value.homeModel
          : homeModel // ignore: cast_nullable_to_non_nullable
              as HomeModel?,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as User?,
      myLover: freezed == myLover
          ? _value.myLover
          : myLover // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HomePageStateCopyWith(
          _$_HomePageState value, $Res Function(_$_HomePageState) then) =
      __$$_HomePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoading,
      String? error,
      bool editing,
      HomeModel? homeModel,
      User? me,
      User? myLover});
}

/// @nodoc
class __$$_HomePageStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HomePageState>
    implements _$$_HomePageStateCopyWith<$Res> {
  __$$_HomePageStateCopyWithImpl(
      _$_HomePageState _value, $Res Function(_$_HomePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? editing = null,
    Object? homeModel = freezed,
    Object? me = freezed,
    Object? myLover = freezed,
  }) {
    return _then(_$_HomePageState(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      editing: null == editing
          ? _value.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as bool,
      homeModel: freezed == homeModel
          ? _value.homeModel
          : homeModel // ignore: cast_nullable_to_non_nullable
              as HomeModel?,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as User?,
      myLover: freezed == myLover
          ? _value.myLover
          : myLover // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_HomePageState implements _HomePageState {
  const _$_HomePageState(
      {this.isLoading,
      this.error,
      required this.editing,
      this.homeModel,
      this.me,
      this.myLover});

  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final bool editing;
  @override
  final HomeModel? homeModel;
  @override
  final User? me;
  @override
  final User? myLover;

  @override
  String toString() {
    return 'HomePageState(isLoading: $isLoading, error: $error, editing: $editing, homeModel: $homeModel, me: $me, myLover: $myLover)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.editing, editing) || other.editing == editing) &&
            (identical(other.homeModel, homeModel) ||
                other.homeModel == homeModel) &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.myLover, myLover) || other.myLover == myLover));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, error, editing, homeModel, me, myLover);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      __$$_HomePageStateCopyWithImpl<_$_HomePageState>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final bool? isLoading,
      final String? error,
      required final bool editing,
      final HomeModel? homeModel,
      final User? me,
      final User? myLover}) = _$_HomePageState;

  @override
  bool? get isLoading;
  @override
  String? get error;
  @override
  bool get editing;
  @override
  HomeModel? get homeModel;
  @override
  User? get me;
  @override
  User? get myLover;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageStateCopyWith<_$_HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
