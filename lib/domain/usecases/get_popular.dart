import 'package:block_app_demo/domain/entities/app_error.dart';
import 'package:block_app_demo/domain/entities/movies_entity.dart';
import 'package:block_app_demo/domain/entities/no_params.dart';
import 'package:block_app_demo/domain/repositories/movie_repository.dart';
import 'package:block_app_demo/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetPopular extends UseCase<List<MoviesEntity>, NoParams> {
  final MovieRepository repository; 

  GetPopular(this.repository);

  @override
  Future<Either<AppError, List<MoviesEntity>>> call(NoParams noParams) async {
    return await repository.getPopular();
  }
}
