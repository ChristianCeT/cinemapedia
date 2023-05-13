import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//proveedor de informacion que notifica su cambio del estado
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
    return MoviesNotifier(fetchMoreMovies: fetchMovies);
  },
);

//Definimos el tipo de funcion que va a recibir el provider
typedef MovieCallBack = Future<List<Movie>> Function({int page});

//sirve para manejar el estado de la lista de peliculas
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    print('loading more movies');
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;
  }
}
