import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class SearchFilm {
  final FilmRepository repo;

  SearchFilm(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type, String query) async {
    return await repo.search(type, query);
  }
}
