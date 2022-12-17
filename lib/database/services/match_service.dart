import 'package:pingscanio/database/repositories/match_repository.dart';
import 'package:pingscanio/objects/match_game.dart';

class MatchService {
  final _matchRepository = MatchRepository();

  Future<void> createMatch(MatchGame match) async {
    return await _matchRepository.createMatch(match);
  }

  Future<List<MatchGame>> getMatches() async {
    return await _matchRepository.getMatches();
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
