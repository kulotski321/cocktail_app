part of 'glass_bloc.dart';

abstract class GlassState extends Equatable {
  const GlassState();

  @override
  List<Object> get props => [];
}

class GlassInitial extends GlassState {}

class GlassLoading extends GlassState {}

class GlassLoaded extends GlassState {
  final List<Drink> glasses;

  const GlassLoaded({
    required this.glasses,
  });
}

class GlassError extends GlassState {
  final String? message;
  const GlassError({
    this.message,
  });
}
