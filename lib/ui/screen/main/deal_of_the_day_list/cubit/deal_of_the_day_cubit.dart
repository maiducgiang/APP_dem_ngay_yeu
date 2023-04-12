import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data/model/product/product2.dart';
import '../../../../../data/repository/customer/customer_repository.dart';

part 'deal_of_the_day_state.dart';

class DealOfTheDayCubit extends Cubit<DealOfTheDayState> {
  final CustomerRepository _customerRepository;
  DealOfTheDayCubit(this._customerRepository) : super(DealOfTheDayInitial());
  @override
  void onChange(Change<DealOfTheDayState> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
