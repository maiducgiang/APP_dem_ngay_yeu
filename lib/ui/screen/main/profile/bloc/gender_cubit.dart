import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderState());
  Future<void> updateGender(int gender) async {
    emit(GenderState(gender: gender));
  }
}
