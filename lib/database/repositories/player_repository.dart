import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pingscanio/objects/player.dart';

class PlayerRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPlayer(Player player) async {
    await _firestore.collection('players').add(player.toJson());
  }

  Future<void> updatePlayer(Player player) async {
    await _firestore
        .collection('players')
        .doc(player.id)
        .update(player.toJson());
  }

  Future<void> deletePlayer(Player player) async {
    await _firestore
        .collection('players')
        .where('firstName', isEqualTo: player.firstName)
        .where('lastName', isEqualTo: player.lastName)
        .where('profilePictureUrl', isEqualTo: player.profilePictureUrl)
        .get()
        .then((value) => value.docs[0].reference.delete());
  }

  Future<List<Player>> getPlayers() {
    return _firestore.collection('players').orderBy('firstName').get().then(
        (value) => value.docs
            .map((e) => Player.fromJson(e.data(), e.id))
            .toList(growable: false));
  }

  Future<List<Player>> getActivesPlayers() {
    return _firestore
        .collection('players')
        .where('gameCount', isGreaterThan: 0)
        .get()
        .then((value) => value.docs
            .map((e) => Player.fromJson(e.data(), e.id))
            .toList(growable: false));
  }

  Future<Player> getPlayerById(String id) {
    return _firestore
        .collection('players')
        .doc(id)
        .get()
        .then((value) => Player.fromJson(value.data()!, value.id));
  }

  Future<List<Player>> getRankedPlayers() async {
    List<Player> players = await getActivesPlayers();
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
