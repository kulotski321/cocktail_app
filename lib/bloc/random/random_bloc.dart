import 'package:cocktail_app/data/drink.dart';
import 'package:cocktail_app/services/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetRandomDrink>((event, emit) async {
      try {
        emit(RandomLoading());
        final drink = await apiRepository.fetchRandomDrink();
        emit(RandomLoaded(drink: drink));
      } on NetworkError {
        emit(const RandomError(
          message: 'Failed to fetch data. Is your device online?',
        ));
      }
    });
  }
}
