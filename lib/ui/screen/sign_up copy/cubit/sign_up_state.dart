part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {required bool isLoading,
      String? error,
      required bool isSignIn,
      bool? addSuccess}) = _SignUpState;

  factory SignUpState.initial() =>
      const SignUpState(isLoading: false, isSignIn: true);
}
