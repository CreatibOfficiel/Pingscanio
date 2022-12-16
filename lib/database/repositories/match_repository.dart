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
    return _firestore.collection('matches').get().then((value) => value.docs
        .map((e) => MatchGame.fromJson(e.data(), e.id))
        .toList(growable: false));
  }

  Future<MatchGame> getMatch(MatchGame match) {
    return _firestore
        .collection('matches')
        .where('winnerId', isEqualTo: match.winnerId)
        .where('loserId', isEqualTo: match.loserId)
        .where('matchSets', isEqualTo: match.matchSets)
        .where('date', isEqualTo: match.date)
        .where('winnerId', isEqualTo: match.winnerId)
        .get()
        .then((value) =>
            MatchGame.fromJson(value.docs[0].data(), value.docs[0].id));
  }
}
