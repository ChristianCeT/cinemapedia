import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

//Se puede buscar en el arbol de providers
final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});
