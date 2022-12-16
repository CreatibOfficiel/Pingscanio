import 'dart:collection';

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

  Future<List<Player>> getPlayersRanked() async {
    List<Player> players = await _playerRepository.getPlayers();
    for (Player player in players) {
      // calculate rank of player based on elo
      int rank = 0;
      for (Player otherPlayer in players) {
        if (player.elo! < otherPlayer.elo!) {
          rank++;
        }
      }

      if (player.rank != rank) {
        player.rank = rank;
        await _playerRepository.updatePlayer(player);
      }

      // sort players by rank
      players.sort((a, b) => a.rank!.compareTo(b.rank!));
    }

    return players;
  }

  Future<Player> getPlayerById(Player player) async {
    return await _playerRepository.getPlayer(player);
  }
}
