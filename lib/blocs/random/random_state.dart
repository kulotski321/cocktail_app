part of 'random_bloc.dart';

abstract class RandomState extends Equatable {
  const RandomState();

  @override
  List<Object> get props => [];
}

class RandomInitial extends RandomState {}

class RandomLoading extends RandomState {}

class RandomLoaded extends RandomState {
  final Drink drink;

  const RandomLoaded({
    required this.drink,
  });
}

class RandomError extends RandomState {
  final String? message;
  const RandomError({
    this.message,
  });
}
