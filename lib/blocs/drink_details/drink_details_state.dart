part of 'drink_details_bloc.dart';

abstract class DrinkDetailsState extends Equatable {
  const DrinkDetailsState();

  @override
  List<Object> get props => [];
}

class DrinkDetailsInitial extends DrinkDetailsState {}

class DrinkDetailsLoading extends DrinkDetailsState {}

class DrinkDetailsLoaded extends DrinkDetailsState {
  final List<Drink> drinks;

  const DrinkDetailsLoaded({
    required this.drinks,
  });
}

class DrinkDetailsError extends DrinkDetailsState {
  final String? message;
  const DrinkDetailsError({
    this.message,
  });
}
