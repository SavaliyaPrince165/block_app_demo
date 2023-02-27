import 'package:block_app_demo/data/data_sources/movies_remote_data_source.dart';
import 'package:block_app_demo/data/models/movies_model.dart';
import 'package:block_app_demo/domain/entities/app_error.dart';
import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:block_app_demo/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MoviesModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies); 
    } on Exception {
      return const Left(
        AppError("Something went wrong"),
      );
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntity>>> getComingSoon()async {
     try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies); 
    } on Exception {
      return const Left(
        AppError("Something went wrong"),
      );
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntity>>> getPlayingNow()async {
     try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies); 
    } on Exception {
      return const Left(
        AppError("Something went wrong"),
      );
    }
  }

  @override
  Future<Either<AppError, List<MoviesEntity>>> getPopular() async{
 try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies); 
    } on Exception {
      return const Left(
        AppError("Something went wrong"),
      );
    }
  }
}
