import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class RemoveWatchlist {
  final FilmRepository repo;

  RemoveWatchlist(this.repo);

  Future<RemoteState<bool>> execute(FilmType type, int id) async {
    return await repo.removeWatchlist(type, id);
  }
}
