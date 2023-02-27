import 'dart:async';

import 'package:block_app_demo/domain/entities/no_params.dart';
import 'package:block_app_demo/domain/usecases/get_trending.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_backdrop_event.dart';
import 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  // MovieBackdropBloc() : super(MovieBackdropInitial()) {}
  final GetTrending? getTrending;
  MovieBackdropBloc({this.getTrending}) : super(MovieBackdropInitial()) {
    on<MovieBackdropLoadEvent>(handleBackdropLoadEvent);
  }

  FutureOr<void> handleBackdropLoadEvent(MovieBackdropLoadEvent event, Emitter<MovieBackdropState> emit) async {
    final moviesEither = await getTrending!(NoParams());
    moviesEither.fold(
      (error) => emit,
      (movieList) => emit(
        MovieBackdropLoaded(movies: movieList, defaultIndex: 0),
      ),
    );
  }

  // Stream<MovieBackdropState> mapEventToState(
  //   MovieBackdropEvent event,
  // ) async* {
  //   yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  // }

  void addAll(MovieBackdropChangedEvent movieBackdropChangedEvent) {}
}
