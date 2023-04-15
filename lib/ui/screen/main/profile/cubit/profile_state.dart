import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({required bool isLoading, String? error}) =
      _ProfileState;

  factory ProfileState.initial({
    String? id,
  }) =>
      const ProfileState(
        isLoading: false,
      );
}
