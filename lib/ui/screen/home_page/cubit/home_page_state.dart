part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {

  const factory HomePageState({
    bool? isLoading,
    String? error,
    required bool editing,
    HomeModel? homeModel,
    User? me,
    User? myLover
  }) = _HomePageState;

  factory HomePageState.initial() => const HomePageState(
    editing: false
  );
}
