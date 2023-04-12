import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/user/user_session.dart';
import 'package:mubaha/ui/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  void updateUserSession(UserSession? userSession) {
    emit(state.copyWith(userSession: userSession));
  }

  void updateTotalCart(int? totalCart) {
    emit(state.copyWith(totalCart: totalCart));
  }
}
