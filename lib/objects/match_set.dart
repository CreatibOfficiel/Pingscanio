import 'package:pingscanio/objects/player.dart';

class MatchSet {
  final int setNumber;
  final Player firstPlayer;
  final Player secondPlayer;
  final int firstPlayerScore;
  final int secondPlayerScore;
  final Player winner;

  MatchSet({
    required this.setNumber,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.firstPlayerScore,
    required this.secondPlayerScore,
    required this.winner,
  });

  factory MatchSet.fromJson(Map<String, dynamic> json) {
    return MatchSet(
      setNumber: json['setNumber'],
      firstPlayer: Player.fromJson(json['firstPlayer'], json['firstPlayerId']),
      secondPlayer:
          Player.fromJson(json['secondPlayer'], json['secondPlayerId']),
      firstPlayerScore: json['firstPlayerScore'],
      secondPlayerScore: json['secondPlayerScore'],
      winner: Player.fromJson(json['winner'], json['winnerId']),
    );
  }

  toJson() {
    return {
      'setNumber': setNumber,
      'firstPlayer': firstPlayer.toJson(),
      'secondPlayer': secondPlayer.toJson(),
      'firstPlayerScore': firstPlayerScore,
      'secondPlayerScore': secondPlayerScore,
      'winner': winner.toJson(),
    };
  }
}
