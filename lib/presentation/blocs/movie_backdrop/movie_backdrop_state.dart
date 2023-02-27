import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackdropChanged extends MovieBackdropState {
  final MoviesEntity movie;

  const MovieBackdropChanged(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieBackdropLoaded extends MovieBackdropState {
  final List<MoviesEntity> movies;
  final int defaultIndex;

  const MovieBackdropLoaded({
    required this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}
