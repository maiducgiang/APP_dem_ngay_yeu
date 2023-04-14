import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsheets/gsheets.dart';
import 'package:mubaha/foundatation/google_sheet_keys.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  Worksheet? _userSheet;
  static final _gsheets = GSheets(ggSheetKey);

  Future initGoogleSheet() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(sheetID);

      _userSheet = await _getWorkSheet(spreadsheet, title: 'User');
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch(e) {
      log(e.toString());
    }
  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title,
      }) async {
    try{
      return await spreadsheet.addWorksheet(title);
    } catch(e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  Future<void> insert(List<Map<String, dynamic>> rowList) async {
    try {
      emit(const SignUpState(isLoading: true));
      await Future.delayed(const Duration(seconds: 1));
      _userSheet!.values.map.appendRows(rowList);
      emit(const SignUpState(isLoading: false, addSuccess: true));
    } catch (e) {
      emit(const SignUpState(isLoading: false, error: 'Đã xảy ra lỗi'));
    }
  }

  SignUpCubit() : super(SignUpState.initial());


}

class SheetsColumn {
  static const name = "name";
  static const phone = "phone";

  static List<String> getColumns() => [name, phone];
}
