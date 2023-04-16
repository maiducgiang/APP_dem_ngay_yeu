import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/ui/screen/home_page/entity/home_model.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final CacheManager _cacheManager = CacheManager.instance;
  HomePageCubit() : super(HomePageState.initial());

  void init(){
    final HomeModel data = _cacheManager.cacheBox.get('home_data') ?? HomeModel();
    emit(state.copyWith(homeModel: data));
  }

  void changeEditing({required bool editing}) {
    emit(HomePageState(editing: editing));
  }

  void updateData({required HomeModel homeModel}) {
    emit(state.copyWith(
      editing: true,
      homeModel: HomeModel(
        firstText: homeModel.firstText ?? state.homeModel?.firstText?? '',
        secondText: homeModel.secondText ?? state.homeModel?.secondText?? '',
        addMoreDayText: homeModel.addMoreDayText ?? state.homeModel?.addMoreDayText?? '',
      )
    ));
  }

  void saveData() async {
    HomeModel? homeModel = state.homeModel;
    _cacheManager.cacheBox.put('home_data', homeModel);
    emit(state.copyWith(editing: false));
  }
}
