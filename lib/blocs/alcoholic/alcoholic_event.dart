part of 'alcoholic_bloc.dart';

abstract class AlcoholicEvent extends Equatable {
  const AlcoholicEvent();

  @override
  List<Object> get props => [];
}

class GetAllAlcoholic extends AlcoholicEvent {}
