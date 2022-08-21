import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class AddWatchlist {
  final FilmRepository repo;

  AddWatchlist(this.repo);

  Future<RemoteState<bool>> execute(FilmType type, Film film) async {
    return await repo.addWatchlist(type, film);
  }
}
