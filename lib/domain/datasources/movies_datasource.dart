import 'package:cinemapedia/domain/entities/movie.dart';

//origenes de dato
abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
