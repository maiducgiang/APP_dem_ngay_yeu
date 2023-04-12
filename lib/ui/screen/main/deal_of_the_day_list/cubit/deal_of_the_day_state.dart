part of 'deal_of_the_day_cubit.dart';

@immutable
abstract class DealOfTheDayState {

}

class DealOfTheDayInitial extends DealOfTheDayState {

}
class ListDealOfTheDay extends DealOfTheDayState{
  List<Product2> list;
  ListDealOfTheDay({required this.list});
}
