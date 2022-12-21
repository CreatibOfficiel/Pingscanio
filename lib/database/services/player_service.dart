import 'package:pingscanio/database/repositories/player_repository.dart';
import 'package:pingscanio/objects/player.dart';

class PlayerService {
  final _playerRepository = PlayerRepository();

  Future<void> createPlayer(Player player) async {
    await _playerRepository.createPlayer(player);
  }

  Future<void> updatePlayer(Player player) async {
    await _playerRepository.updatePlayer(player);
  }

  Future<void> deletePlayer(Player player) async {
    await _playerRepository.deletePlayer(player);
  }

  Future<List<Player>> getPlayers() async {
    return await _playerRepository.getPlayers();
  }

  Future<Player> getPlayerById(String id) async {
    return await _playerRepository.getPlayerById(id);
  }

  Future<List<Player>> getRankedPlayers() async {
    List<Player> players = await _playerRepository.getActivesPlayers();
    players.sort((a, b) => b.elo!.compareTo(a.elo!));
    // check rank of players, if same elo, same rank, and if rank is not the same as bdd, update it
    int rank = 1;
    for (int i = 0; i < players.length; i++) {
      if (i > 0 && players[i].elo != players[i - 1].elo) {
        rank++;
      }
      if (players[i].rank != rank) {
        players[i].rank = rank;
        updatePlayer(players[i]);
      }
    }
    players.sort((a, b) => a.rank!.compareTo(b.rank!));
    return players;
  }
}
