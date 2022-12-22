import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pingscanio/objects/match_game.dart';

class MatchRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createMatch(MatchGame match) async {
    await _firestore.collection('matches').add(match.toJson());
  }

  Future<void> updateMatch(MatchGame match) async {
    await _firestore.collection('matches').doc(match.id).update(match.toJson());
  }

  Future<void> deleteMatch(MatchGame match) async {
    await _firestore.collection('matches').doc(match.id).delete();
  }

  Future<List<MatchGame>> getMatches() {
    return _firestore.collection('matches')
        .orderBy('date', descending: true)
        .get().then((value) => value.docs
        .map((e) => MatchGame.fromJson(e.data(), e.id))
        .toList(growable: false));
  }

  Future<List<MatchGame>> getRecentMatches() {
    return _firestore
        .collection('matches')
        .orderBy('date', descending: true)
        .limit(8)
        .get()
        .then((value) => value.docs
            .map((e) => MatchGame.fromJson(e.data(), e.id))
            .toList(growable: false));
  }

  Future<MatchGame> getMatchById(String id) {
    return _firestore
        .collection('matches')
        .doc(id)
        .get()
        .then((value) => MatchGame.fromJson(value.data()!, value.id));
  }
}
