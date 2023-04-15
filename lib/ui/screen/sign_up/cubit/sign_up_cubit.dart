import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gsheets/gsheets.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {

  Worksheet? _userSheet;

  static final _gsheets = GSheets({
      "type": "service_account",
      "project_id": "appovecounter",
      "private_key_id": dotenv.get('PRIVATE_KEY_ID'),
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC6w68CbZPYVHRU\npkyjECKw10FoHJQwhRJdXdk+yWydeJvZn57pMvoIjKk7VVu5QSDyKORm4R8yR0vc\nYMNTsrr1RS1uV9EQeWbEiu1hL4d/L/gHc7wlfMTNFoL4Ukn1RlimNtzaaRgqmpff\n8wyUW6ix7P+VkxUokxMpfhvTS3Z47FIhrpSJ6lIEh75zoWUZKl6y5AiILIEIGI/9\nfrydpXZN+sETJhVa5JfVqNKt9vSFXy0E0UR1L2J0GQRMfYLyjhWoYmBNf8XqWx3Q\nzXK0PFdiWaRD3U6CAd+uZZSjEKZiZbmuLYWA1cUmfnHLnJTndHL3/JhN0drArk5A\nU0tWIfzfAgMBAAECggEABnBjssY7YCx9PEPlhYOzZnxtZV0C4O9dlDl9mXQRWhaD\n7QtbS7f1teC/nuuQ94Ce1aqCQWfGjxG1NFpjsZmKZ5VkfRbq/tHosKMHjx+34LMz\nLnKXjIVSNa3ugwg3Q40S1lwy3hbcfe+Jh++VwfGtDcFZiHsjMhxr/zS5Wd4SrhWM\nl+Gg8wTQS++wyq6we+dwVD8trT20Jz06YRsxxshJIfJCUWC7oRoF4DcugrvQeb2s\nn235Pa0YMB9sGpBXpo2uX4yxqESYQ6pWoN4i+lTD7Q2sWAgwlh+jMwyPPSn/Fxss\n0lkownk+UzSfsoc2hOzxj6PvZ4mJWhXQVtyU2OCyCQKBgQDt08sbX7ljXrs9WioP\nF+uTAPXkrQxwEC+32LjQTDsP73HMPC0Xfgy8Jul1YAUFxY3alRlWTeCAxLaVC/Eo\nYpGcRkE9xDo1MmWuFQstvnGk4clQ1hzQ1bZZtt495bJf1MOj6gHbrTsTDf4Imxv7\nE4JrDG/ZfqN7AdK9d3IWHBuG6QKBgQDJCQi2Gmmo06/Bzs3SOiFeOg8BbAx6OuII\nbY9E+jmFVJOwnjQwlTiBTJ+r8aA4VLuVf3TH9GYRE4dYMoFW5FtQZkHa4O/ZxGj3\n895il3FGYOKmSLL+r3+pPRCuhXwoZ2vSoj1Ta7VYB0kwPUI5ZPkOmGNxUM1m+5/A\nhT+7jDgYhwKBgQC1uIsNE4t4Hj47ltVkSwa5gJZicMd8KSIM/A/bOSQ3/OGbCK/7\nr1jTu3fPM9simdzWE+8UPtU4DxbjtAhEr2xLWHMpWvKPCz8eUP4Fqerz7YIBvliu\nSV3YFx6hdQ1ipBQI/xkEXc0xthNRSBONOU8BtLMSIO2RY8c+9jG6KyftYQKBgQDG\nJINTiQDvB4XJjd1LAUR2LN8xVZ+OsY6rI+D76WzcPxo6EBP8dnb06eLOhB6Yptsk\nZDVkBzy6Q/c4NL9KN1TRD5iE9QMyLeYPzWs43W8mIMQDhM/3Ol6nHardeG+BGz4o\nowOyvwxDsRqv0xD8pMrdWdFZlHx+ri8sf6jrXy7C7QKBgQCXugDtg4T3viwxnVo8\nrN3cO7ZVriTTjrVT3GzWetYnE547/hm0CaoNDYI7sHtuHN5wlov2lH9dzlkdIAAi\nuCWX7ptzgCn8tI7Y1lqO+eDHbQszmQN0DctwDiAhPIvYLelcCyAEdnX5uWYUhR/Z\nnV5GrPgpZSkSVP5tvJlz7m2yVg==\n-----END PRIVATE KEY-----\n",
      "client_email": "lovecounter@appovecounter.iam.gserviceaccount.com",
      "client_id": "106363190040046973101",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/lovecounter%40appovecounter.iam.gserviceaccount.com"
  });

  Future initGoogleSheet() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(dotenv.get('SHEET_ID'));

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
