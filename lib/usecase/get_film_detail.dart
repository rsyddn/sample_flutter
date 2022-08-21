import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class GetFilmDetail {
  final FilmRepository repo;

  GetFilmDetail(this.repo);

  Future<RemoteState<Film>> execute(FilmType type, int id) async {
    return await repo.getDetail(type, id);
  }
}
