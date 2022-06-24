part of 'random_bloc.dart';

abstract class RandomEvent extends Equatable {
  const RandomEvent();

  @override
  List<Object> get props => [];
}

class GetRandomDrink extends RandomEvent {}
