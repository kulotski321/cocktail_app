part of 'alcoholic_bloc.dart';

abstract class AlcoholicState extends Equatable {
  const AlcoholicState();

  @override
  List<Object> get props => [];
}

class AlcoholicInitial extends AlcoholicState {}

class AlcoholicLoading extends AlcoholicState {}

class AlcoholicLoaded extends AlcoholicState {
  final List<Drink> alcoholics;

  const AlcoholicLoaded({
    required this.alcoholics,
  });
}

class AlcoholicError extends AlcoholicState {
  final String? message;
  const AlcoholicError({
    this.message,
  });
}
