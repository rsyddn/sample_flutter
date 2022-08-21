import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class GetWatchlist {
  final FilmRepository repo;

  GetWatchlist(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type) async {
    return await repo.getWatchlist(type);
  }
}
