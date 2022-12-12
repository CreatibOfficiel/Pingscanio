import 'package:pingscanio/objects/match_set.dart';
import 'package:pingscanio/objects/player.dart';

class Match {
  final String? id;
  final Player firstPlayer;
  final Player secondPlayer;
  final List<MatchSet> matchSets;
  final DateTime? date;
  final Player? winner;

  Match(
      {this.id,
      required this.firstPlayer,
      required this.secondPlayer,
      required this.matchSets,
      this.date,
      this.winner});

  factory Match.fromJson(Map<String, dynamic> json, String id) {
    return Match(
      id: id,
      firstPlayer: Player.fromJson(json['firstPlayer'], json['firstPlayerId']),
      secondPlayer:
          Player.fromJson(json['secondPlayer'], json['secondPlayerId']),
      matchSets: json['matchSets']
          .map<MatchSet>((matchSet) => MatchSet.fromJson(matchSet))
          .toList()
          .cast<MatchSet>(),
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      winner: json['winner'] != null
          ? Player.fromJson(json['winner'], json['winnerId'])
          : null,
    );
  }

  toJson() {
    return {
      'firstPlayer': firstPlayer.toJson(),
      'secondPlayer': secondPlayer.toJson(),
      'matchSets': matchSets.map((matchSet) => matchSet.toJson()).toList(),
      'date': date != null ? date!.toIso8601String() : null,
      'winner': winner != null ? winner!.toJson() : null,
    };
  }
}
