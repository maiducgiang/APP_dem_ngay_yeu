import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_board_state.freezed.dart';

@freezed
class EditBoardState with _$EditBoardState {
  const factory EditBoardState(
      {required bool isLoading,
      required List<XFile> imageFileList,
      String? error}) = _EditBoardState;

  factory EditBoardState.initial({
    String? id,
  }) =>
      const EditBoardState(isLoading: false, imageFileList: []);
}
