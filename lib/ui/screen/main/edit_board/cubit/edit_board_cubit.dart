import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/board_local/board_model.dart';
import 'package:mubaha/ui/screen/main/edit_board/cubit/edit_board_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

class EditBoardCubit extends Cubit<EditBoardState> {
  EditBoardCubit() : super(EditBoardState.initial());
  final ImagePicker imagePicker = ImagePicker();
  final _cacheManager = CacheManager.instance;
  List<Uint8List> imageFileList = [];
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
        Uint8List imageBytes = await pickedFile.readAsBytes();
        imageFileList.add(imageBytes);
        emit(state
            .copyWith(imageFileList: [...state.imageFileList, imageBytes]));
      }
    }
  }

  void init(BoardModelLocal? boardModelLocal) async {
    if (boardModelLocal != null) {
      emit(state.copyWith(
          boardModelLocal: boardModelLocal,
          title: boardModelLocal.title,
          day: boardModelLocal.time,
          imageFileList: boardModelLocal.listImage ?? []));
    }
  }

  void setDay(DateTime day) {
    emit(state.copyWith(day: day));
  }

  getFromCamera() async {
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      imageFileList.add(imageBytes);
      emit(state.copyWith(imageFileList: [...state.imageFileList, imageBytes]));
    }
  }

  deleteImage(int index) {
    List<Uint8List> a = [];
    for (int i = 0; i < state.imageFileList.length; i++) {
      if (i != index) {
        a.add(state.imageFileList[i]);
      }
    }
    emit(state.copyWith(imageFileList: a));
  }

  void save(
      {required String title, String? content, required DateTime time}) async {
    // List<XFile> imageXFile = state.imageFileList;
    // List<Uint8List> listImage = [];
    // if (state.imageFileList.length >= 1) {
    //   Uint8List imageBytes = await imageXFile[0].readAsBytes();
    //   listImage.add(imageBytes);
    // }
    // if (state.imageFileList.length >= 2) {
    //   Uint8List imageBytes = await imageXFile[1].readAsBytes();
    //   listImage.add(imageBytes);
    // }
    // if (state.imageFileList.length >= 3) {
    //   Uint8List imageBytes = await imageXFile[2].readAsBytes();
    //   listImage.add(imageBytes);
    // }
    if (state.boardModelLocal != null) {
      _cacheManager.addBoardToCache(BoardModelLocal(
          id: state.boardModelLocal!.id,
          title: title,
          time: time,
          listImage: state.imageFileList));
    } else {
      _cacheManager.addBoardToCache(BoardModelLocal(
          title: title, time: time, listImage: state.imageFileList));
    }
  }
}
