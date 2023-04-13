import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/ui/screen/main/edit_board/cubit/edit_board_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

class EditBoardCubit extends Cubit<EditBoardState> {
  EditBoardCubit() : super(EditBoardState.initial());
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  handlePickImage(ImageSource source) async {
    // isLoadingUpdateImage(true);
    final permission =
        source == ImageSource.camera ? Permission.camera : ImageSource.gallery;

    final pickedFile = await imagePicker.pickImage(
      source: source,
    );
    if (pickedFile == null) {
      return;
    }

    final fileExtension = p.extension(pickedFile.path).replaceAll('.', '');
    if (fileExtension != 'png' &&
        fileExtension != 'jpg' &&
        fileExtension != 'jpeg') {
      if (pickedFile != null) {
        imageFileList.add(pickedFile);
        emit(state
            .copyWith(imageFileList: [...state.imageFileList, pickedFile]));
      }
    }
  }

  getFromCamera() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      imageFileList.add(pickedFile);
      emit(state.copyWith(imageFileList: [...state.imageFileList, pickedFile]));
    }
  }

  deleteImage(int index) {
    List<XFile> a = [];
    for (int i = 0; i < state.imageFileList.length; i++)
      if (i != index) {
        a.add(state.imageFileList[i]);
      }
    emit(state.copyWith(imageFileList: a));
  }
}
