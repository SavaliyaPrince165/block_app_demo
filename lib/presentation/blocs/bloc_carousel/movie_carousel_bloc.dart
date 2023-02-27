import 'dart:async';

import 'package:block_app_demo/domain/entities/no_params.dart';
import 'package:block_app_demo/domain/usecases/get_trending.dart';
import 'package:block_app_demo/presentation/blocs/bloc_carousel/movie_carousel_event.dart';
import 'package:block_app_demo/presentation/blocs/bloc_carousel/movie_carousel_state.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending? getTrending;
  final MovieBackdropBloc? movieBackdropBloc;

  MovieCarouselBloc({this.getTrending, this.movieBackdropBloc}) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>(handleCarousalLoadEvent);
  }

  void addAll(CarouselLoadEvent carouselLoadEvent) {}

  FutureOr<void> handleCarousalLoadEvent(CarouselLoadEvent event, Emitter<MovieCarouselState> emit) async {
    final moviesEither = await getTrending!(NoParams());
    moviesEither.fold(
      (error) => emit,
      (movieList) {
        movieBackdropBloc?.addAll(MovieBackdropChangedEvent(movieList[event.defaultIndex]));
        return emit(
          MovieCarouselLoaded(
            movies: movieList,
            defaultIndex: event.defaultIndex,
          ),
        );
      },
    );
  }
}
