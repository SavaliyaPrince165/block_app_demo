import 'dart:ui';

import 'package:block_app_demo/common/constants/size_constants.dart';
import 'package:block_app_demo/common/extensions/size_extensions.dart';
import 'package:block_app_demo/common/screenutils/screen_util.dart';
import 'package:block_app_demo/data/core/api_constants.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:block_app_demo/presentation/blocs/movie_backdrop/movie_backdrop_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print(" MovieBackdropWidget -->  00");
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_40.w),
        ),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                builder: (context, state) {
                  print("show in image :- 000");
                  if (state is MovieBackdropChanged) {
                    print("show in image :- ${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}");
                    return CachedNetworkImage(
                      imageUrl: '${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  print("show in image :- 111");
                  return const SizedBox.shrink();
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
