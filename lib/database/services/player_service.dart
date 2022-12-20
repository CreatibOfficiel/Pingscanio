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
    return await _playerRepository.getRankedPlayers();
  }
}
