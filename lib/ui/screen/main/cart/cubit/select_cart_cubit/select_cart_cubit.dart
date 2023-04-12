import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/ui/screen/main/cart/cubit/select_cart_cubit/select_cart_state.dart';

class SelectCartCubit extends Cubit<SelectCartState> {
  SelectCartCubit() : super(SelectCartState.initial());
  List<String> idList = [];

  Future<void> selectCart({required CartDocs id, bool isAdd = true}) async {
    // isAdd ? idList.add(id) : idList.remove(id);
    emit(state.copyWith(idList: idList));
    print(idList);
  }
}
