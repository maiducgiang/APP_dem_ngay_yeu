import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
abstract class SigninState with _$SigninState {
  const factory SigninState(
      {required bool isLoading, String? error, String? token}) = _SigninState;

  factory SigninState.initial() => const SigninState(isLoading: false);
}



