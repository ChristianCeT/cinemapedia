import 'package:cinemapedia/domain/entities/movie.dart';

//llamada al datasource
abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
