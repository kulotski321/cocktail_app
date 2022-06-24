part of 'drink_details_bloc.dart';

abstract class DrinkDetailsEvent extends Equatable {
  const DrinkDetailsEvent();

  @override
  List<Object> get props => [];
}

class SearchByDrinkName extends DrinkDetailsEvent {
  final String drinkName;
  const SearchByDrinkName({
    required this.drinkName,
  });
}
