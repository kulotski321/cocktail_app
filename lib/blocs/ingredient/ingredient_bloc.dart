import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/services/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ingredient_event.dart';
part 'ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  IngredientBloc() : super(IngredientInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetAllIngredients>((event, emit) async {
      try {
        emit(IngredientLoading());
        final ingredients = await apiRepository.fetchIngredients();
        emit(IngredientLoaded(ingredients: ingredients));
      } on NetworkError {
        emit(const IngredientError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });
  }
}
