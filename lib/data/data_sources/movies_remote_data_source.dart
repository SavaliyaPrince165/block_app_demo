import 'dart:convert';

import 'package:block_app_demo/data/core/api_client.dart';
import 'package:block_app_demo/data/models/movies_model.dart';
import 'package:block_app_demo/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MoviesModel>> getTrending();
  Future<List<MoviesModel>> getPopular();
  Future<List<MoviesModel>> getPlayingNow();
  Future<List<MoviesModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;
  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MoviesModel>> getTrending() async {
    final response = await _client.get("trending/movie/day");
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies :- $movies");
    return movies!;
  }

  @override
  Future<List<MoviesModel>> getPopular() async {
    final response = await _client.get("movie/popular");
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies :- $movies");
    return movies!;
  }

  @override
  Future<List<MoviesModel>> getComingSoon() async {
    final response = await _client.get("movie/upcoming");
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies :- $movies");
    return movies!;
  }

  @override
  Future<List<MoviesModel>> getPlayingNow() async {
    final response = await _client.get("movie/now_playing");
    final movies = MoviesResultModel.fromJson(response).movies;
    print("movies :- $movies");
    return movies!;
  }
}
