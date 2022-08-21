import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class GetFilmNowPlaying {
  final FilmRepository repo;

  GetFilmNowPlaying(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type) async {
    return await repo.getNowPlaying(type);
  }
}
