import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/user_local/user_model_local.dart';
import 'package:mubaha/ui/screen/main/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  final _cacheManager = CacheManager.instance;
  void init() async {
    await _cacheManager
        .addUserToCached(UserLocal(name: "giang1234", phone: "0374168445"));
    UserLocal userLocal = await _cacheManager.getUserCached();
    emit(state.copyWith(userLocal: userLocal));
  }
}
