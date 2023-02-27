import 'package:block_app_demo/domain/entities/app_error.dart';
import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<AppError,List<MoviesEntity>>> getTrending();
  Future<Either<AppError,List<MoviesEntity>>> getPopular();
  Future<Either<AppError,List<MoviesEntity>>> getPlayingNow();
  Future<Either<AppError,List<MoviesEntity>>> getComingSoon();
}
