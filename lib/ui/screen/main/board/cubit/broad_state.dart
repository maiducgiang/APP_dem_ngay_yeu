import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/board_local/board_model.dart';

part 'broad_state.freezed.dart';

@freezed
class BroadState with _$BroadState {
  const factory BroadState(
      {required bool isLoading,
      required List<BoardModelLocal> listBoardLocal,
      String? error}) = _BroadState;

  factory BroadState.initial({
    String? id,
  }) =>
      const BroadState(
        listBoardLocal: [],
        isLoading: false,
      );
}
