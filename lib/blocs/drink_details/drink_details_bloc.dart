import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/services/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drink_details_event.dart';
part 'drink_details_state.dart';

class DrinkDetailsBloc extends Bloc<DrinkDetailsEvent, DrinkDetailsState> {
  DrinkDetailsBloc() : super(DrinkDetailsInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<SearchByDrinkName>((event, emit) async {
      try {
        emit(DrinkDetailsLoading());
        final drink = await apiRepository.fetchDrinkDetails(event.drinkName);
        emit(DrinkDetailsLoaded(drink: drink));
      } on NetworkError {
        emit(const DrinkDetailsError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });
  }
}
