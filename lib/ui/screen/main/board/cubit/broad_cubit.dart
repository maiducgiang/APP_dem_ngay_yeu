import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/board_local/board_model.dart';
import 'package:mubaha/ui/screen/main/board/cubit/broad_state.dart';

class BroadCubit extends Cubit<BroadState> {
  BroadCubit() : super(BroadState.initial());

  final _cacheManager = CacheManager.instance;
  void init() {
    List<BoardModelLocal> dataLocal = _cacheManager.getAllBoard();
    emit(state.copyWith(listBoardLocal: dataLocal));
  }
}
