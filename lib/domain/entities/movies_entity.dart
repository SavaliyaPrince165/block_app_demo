class MoviesEntity {
  final String? posterPath;
  final int? id;
  final String? backdropPath;
  final String? title;
  final num? voteAverage;
  final String? releseDate;
  final String? overview;

  const MoviesEntity({
    this.backdropPath,
    this.id,
    this.overview,
    this.posterPath,
    this.releseDate,
    this.voteAverage,
    this.title,
  }) : assert(id != null, "Movie id must not be null");

  @override
  List<Object> get props => [id!, title!];

  @override
  bool get stringify => true;
}
