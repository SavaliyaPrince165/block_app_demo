import 'package:block_app_demo/data/models/movies_model.dart';

class MoviesResultModel {
  List<MoviesModel>? movies;

  MoviesResultModel({this.movies,});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MoviesModel>[];
      json['results'].forEach((v) {
        movies!.add(MoviesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}