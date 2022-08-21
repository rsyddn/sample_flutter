import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/config/remote_state.dart';
import 'package:sample_flutter/repository/film_repository.dart';

class GetWatchlistExist {
  final FilmRepository repo;

  GetWatchlistExist(this.repo);

  Future<RemoteState<bool>> execute(FilmType type, int id) async {
    return await repo.getExistWatchlist(type, id);
  }
}
