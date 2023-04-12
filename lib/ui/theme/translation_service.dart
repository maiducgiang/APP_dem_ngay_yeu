import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mubaha/data/model/language/language_app.dart';

class LocalizationService {
// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)

  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = ['en', 'vi', 'ko', "ja", "zh"];
  static final langCodeWithFlag = [
    LanguageAppModel(
        langCodes: "vi",
        lang: "Tiếng Việt",
        country: "Việt Nam",
        langFlag:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/1200px-Flag_of_Vietnam.svg.png"),
    LanguageAppModel(
        langCodes: "en",
        lang: "English",
        country: "U.S",
        langFlag:
            "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png"),
    LanguageAppModel(
        langCodes: "zh",
        lang: "中文",
        country: "China",
        langFlag:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/1280px-Flag_of_the_People%27s_Republic_of_China.svg.png"),
    LanguageAppModel(
        langCodes: "ko",
        lang: "Korean",
        country: "Korea",
        langFlag:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/800px-Flag_of_South_Korea.svg.png"),
    LanguageAppModel(
        langCodes: "ja",
        lang: "Japanese",
        country: "Japan",
        langFlag:
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png"),
  ];
// các Locale được support
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
    const Locale('ko', 'KR'),
    const Locale('ja', 'JP'),
    const Locale('zh', 'CN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
    'ko': 'Korean',
    'ja': '日语',
    'zh': '中文'
  });

  // @override
  // Map<String, Map<String, String>> get keys => {
  //       'en_US': en,
  //       'vi_VN': vi,
  //       'ko_KR': ko,
  //       'ja_JP': ja,
  //       'zh_CN': zh,
  //     };
}
