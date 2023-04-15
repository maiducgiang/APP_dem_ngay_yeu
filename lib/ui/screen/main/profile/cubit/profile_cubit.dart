import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/user_local/user_model_local.dart';
import 'package:mubaha/ui/screen/main/profile/cubit/profile_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  final _cacheManager = CacheManager.instance;
  void init() async {
    // await _cacheManager
    //     .addUserToCached(UserLocal(name: "giang1234", phone: "0374168445"));
    UserLocal userLocal = await _cacheManager.getUserCached();
    emit(state.copyWith(userLocal: userLocal));
  }

  void writeEvaluate() {
    if (Platform.isIOS) {
    } else if (Platform.isAndroid) {
      //Fluttertoast.showToast(msg: "Show android");
    }
  }

  void shareApp() {
    if (Platform.isIOS) {
    } else if (Platform.isAndroid) {
      //Fluttertoast.showToast(msg: "Show android");
    }
  }

  void seeOtherApps() async {
    if (Platform.isIOS) {
    } else if (Platform.isAndroid) {
      // try {
      //   Uri chPlayLaunchUri = Uri(
      //     scheme: 'https',
      //     path: 'https://play.google.com/store/games?pli=1',
      //   );
      //   if (await canLaunchUrl(chPlayLaunchUri)) {
      //     launchUrl(
      //       chPlayLaunchUri,
      //     );
      //   }
      // } catch (e) {
      //   e;
      // }
    }
  }

  void contactUs() async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'mailto:mdgiang2001@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Example Subject & Symbols are allowed!',
        }),
      );
      launchUrl(emailLaunchUri);
    } catch (e) {
      e;
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
