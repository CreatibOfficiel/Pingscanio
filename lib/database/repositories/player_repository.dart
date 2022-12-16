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
    return _firestore.collection('players').get().then((value) => value.docs
        .map((e) => Player.fromJson(e.data(), e.id))
        .toList(growable: false));
  }

  Future<Player> getPlayer(Player player) {
    return _firestore
        .collection('players')
        .where('firstName', isEqualTo: player.firstName)
        .where('lastName', isEqualTo: player.lastName)
        .where('profilePictureUrl', isEqualTo: player.profilePictureUrl)
        .get()
        .then(
            (value) => Player.fromJson(value.docs[0].data(), value.docs[0].id));
  }
}