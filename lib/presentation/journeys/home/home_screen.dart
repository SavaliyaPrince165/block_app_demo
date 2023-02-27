import 'package:block_app_demo/di/get_it.dart';
import 'package:block_app_demo/presentation/blocs/bloc_carousel/movie_carousel_bloc.dart';
import 'package:block_app_demo/presentation/blocs/bloc_carousel/movie_carousel_event.dart';
import 'package:block_app_demo/presentation/blocs/bloc_carousel/movie_carousel_state.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:block_app_demo/presentation/journeys/movie_carousel/movie_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;

  @override
  void initState() {
    movieCarouselBloc = getItInStance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc!;
    movieCarouselBloc.add(const CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("block event one : ");
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => movieCarouselBloc,
          ),
          BlocProvider(
            create: (context) => movieBackdropBloc,
          )
        ],
        child: Scaffold(
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
            bloc: movieCarouselBloc,
            builder: (context, state) {
              print("block event two : ");
              if (state is MovieCarouselLoaded) {
                print("block event three : ");
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex,
                      ),
                    ),
                    const FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: Placeholder(color: Colors.white),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
