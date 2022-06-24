part of 'drink_list_bloc.dart';

abstract class DrinkListEvent extends Equatable {
  const DrinkListEvent();

  @override
  List<Object> get props => [];
}

class SearchByCategory extends DrinkListEvent {
  final String categoryName;
  const SearchByCategory({
    required this.categoryName,
  });
}

class SearchByGlass extends DrinkListEvent {
  final String glassName;
  const SearchByGlass({
    required this.glassName,
  });
}

class SearchByAlcoholic extends DrinkListEvent {
  final String alcoholicOption;
  const SearchByAlcoholic({
    required this.alcoholicOption,
  });
}

class SearchByIngredient extends DrinkListEvent {
  final String ingredientName;
  const SearchByIngredient({
    required this.ingredientName,
  });
}
