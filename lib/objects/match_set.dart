import 'package:pingscanio/objects/player.dart';

class MatchSet {
  final int setNumber;
  final int winnerScore;
  final int loserScore;
  final Player winner;

  MatchSet({
    required this.setNumber,
    required this.winnerScore,
    required this.loserScore,
    required this.winner,
  });

  factory MatchSet.fromJson(Map<String, dynamic> json) {
    return MatchSet(
      setNumber: json['setNumber'],
      winnerScore: json['winnerScore'],
      loserScore: json['loserScore'],
      winner: Player.fromJson(json['winner'], json['winnerId']),
    );
  }

  toJson() {
    return {
      'setNumber': setNumber,
      'winnerScore': winnerScore,
      'loserScore': loserScore,
      'winner': winner.toJson(),
    };
  }
}
