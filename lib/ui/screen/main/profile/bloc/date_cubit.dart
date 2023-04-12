import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/ui/screen/main/profile/bloc/date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(DateState());
  Future<void> updateDate(DateTime dateTime) async {
    emit(DateState(dateTime: dateTime));
  }
}
