import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:block_app_demo/presentation/journeys/movie_carousel/movie_backdrop_widget.dart';
import 'package:block_app_demo/presentation/journeys/movie_carousel/movie_page_view.dart';
import 'package:block_app_demo/presentation/widgets/movie_app_bar.dart';
import 'package:flutter/material.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MoviesEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget({
    super.key,
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            )
          ],
        ),
      ],
    );
  }
}
