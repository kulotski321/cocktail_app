part of 'glass_bloc.dart';

abstract class GlassEvent extends Equatable {
  const GlassEvent();

  @override
  List<Object> get props => [];
}

class GetAllGlasses extends GlassEvent {}
