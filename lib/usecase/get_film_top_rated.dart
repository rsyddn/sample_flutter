import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class GetFilmTopRated {
  final FilmRepository repo;

  GetFilmTopRated(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type) async {
    return await repo.getTopRated(type);
  }
}
