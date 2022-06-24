part of 'ingredient_bloc.dart';

abstract class IngredientState extends Equatable {
  const IngredientState();

  @override
  List<Object> get props => [];
}

class IngredientInitial extends IngredientState {}

class IngredientLoading extends IngredientState {}

class IngredientLoaded extends IngredientState {
  final List<Drink> ingredients;

  const IngredientLoaded({
    required this.ingredients,
  });
}

class IngredientError extends IngredientState {
  final String? message;
  const IngredientError({
    this.message,
  });
}
