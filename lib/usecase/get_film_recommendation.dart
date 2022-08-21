import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class GetFilmRecommendation {
  final FilmRepository repo;

  GetFilmRecommendation(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type, int id) async {
    return await repo.getRecommendations(type, id);
  }
}
