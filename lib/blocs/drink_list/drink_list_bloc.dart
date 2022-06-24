import 'package:bloc/bloc.dart';
import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/services/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'drink_list_event.dart';
part 'drink_list_state.dart';

class DrinkListBloc extends Bloc<DrinkListEvent, DrinkListState> {
  DrinkListBloc() : super(DrinkListInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<SearchByCategory>((event, emit) async {
      try {
        emit(DrinkListLoading());
        final drinks = await apiRepository.filterByCategory(event.categoryName);
        emit(DrinkListLoaded(drinks: drinks));
      } on NetworkError {
        emit(const DrinkListError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });

    on<SearchByGlass>((event, emit) async {
      try {
        emit(DrinkListLoading());
        final drinks = await apiRepository.filterByGlass(event.glassName);
        emit(DrinkListLoaded(drinks: drinks));
      } on NetworkError {
        emit(const DrinkListError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });

    on<SearchByAlcoholic>((event, emit) async {
      try {
        emit(DrinkListLoading());
        final drinks =
            await apiRepository.filterByAlcoholic(event.alcoholicOption);
        emit(DrinkListLoaded(drinks: drinks));
      } on NetworkError {
        emit(const DrinkListError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });

    on<SearchByIngredient>((event, emit) async {
      try {
        emit(DrinkListLoading());
        final drinks =
            await apiRepository.filterByIngredient(event.ingredientName);
        emit(DrinkListLoaded(drinks: drinks));
      } on NetworkError {
        emit(const DrinkListError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });
  }
}
