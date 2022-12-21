import 'package:pingscanio/database/repositories/match_repository.dart';
import 'package:pingscanio/objects/match_game.dart';

class MatchService {
  final _matchRepository = MatchRepository();

  Future<void> createMatch(MatchGame match) async {
    return await _matchRepository.createMatch(match);
  }

  Future<List<MatchGame>> getMatchesOfTwoPlayers(String firstPlayerId, String secondPlayerId, String matchId) async {
    List<MatchGame> matches = await _matchRepository.getMatches();
    List<MatchGame> matchesOfPlayers = matches.where((element) => 
            (element.winnerId == firstPlayerId || 
            element.loserId == firstPlayerId) &&
            (element.winnerId == secondPlayerId ||
            element.loserId == secondPlayerId) &&
            element.id != matchId).toList();
    if (matchesOfPlayers.length > 3) {
      matchesOfPlayers = matchesOfPlayers.sublist(0, 3);
    }
    return matchesOfPlayers;
  }

  Future<void> updateMatch(MatchGame match) async {
    return await _matchRepository.updateMatch(match);
  }

  Future<void> deleteMatch(MatchGame match) async {
    return await _matchRepository.deleteMatch(match);
  }

  Future<MatchGame> getMatchById(String id) async {
    return await _matchRepository.getMatchById(id);
  }

  Future<List<MatchGame>> getRecentMatches() async {
    return await _matchRepository.getRecentMatches();
  }
}
