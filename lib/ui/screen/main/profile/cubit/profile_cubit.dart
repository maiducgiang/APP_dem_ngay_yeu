import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/ui/screen/main/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
}
