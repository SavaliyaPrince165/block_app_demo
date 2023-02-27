import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitialEvent extends MovieBackdropEvent {}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MoviesEntity movie;

  const MovieBackdropChangedEvent(this.movie);

  List<Object> get props => [movie];
}

class MovieBackdropLoadEvent extends MovieBackdropEvent {
  final int defaultIndex;

  const MovieBackdropLoadEvent({this.defaultIndex = 0}) : assert(defaultIndex >= 0, 'defultIndex cannot be less than 0');

  @override
  List<Object> get props => [defaultIndex];
}
