part of 'drink_list_bloc.dart';

abstract class DrinkListState extends Equatable {
  const DrinkListState();

  @override
  List<Object> get props => [];
}

class DrinkListInitial extends DrinkListState {}

class DrinkListLoading extends DrinkListState {}

class DrinkListLoaded extends DrinkListState {
  final List<Drink> drinks;

  const DrinkListLoaded({
    required this.drinks,
  });
}

class DrinkListError extends DrinkListState {
  final String? message;
  const DrinkListError({
    this.message,
  });
}
