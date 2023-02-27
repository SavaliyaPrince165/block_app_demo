import 'package:block_app_demo/common/constants/size_constants.dart';
import 'package:block_app_demo/common/extensions/size_extensions.dart';
import 'package:block_app_demo/common/screenutils/screen_util.dart';
import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';
import 'package:block_app_demo/presentation/journeys/movie_carousel/animated_movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePageView extends StatefulWidget {
  final List<MoviesEntity> movies;
  final int initialPage;
  const MoviePageView({
    super.key,
    required this.movies,
    required this.initialPage,
  }) : assert(initialPage >= 0, 'initialPage cannot be less than 0');

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_10.h,
      ),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MoviesEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            movieId: movie.id!,
            index: index,
            pageController: _pageController,
            posterPath: movie.posterPath!,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context).addAll(
            MovieBackdropChangedEvent(widget.movies[index]),
          );
          print("widget.movies[index] ---> ${widget.movies[index]}");
        },
      ),
    );
  }
}
