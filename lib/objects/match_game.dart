import 'package:pingscanio/objects/match_set.dart';

class MatchGame {
  final String? id;
  final String winnerId;
  final String loserId;
  final List<MatchSet> matchSets;
  final DateTime date;

  MatchGame(
      {this.id,
      required this.winnerId,
      required this.loserId,
      required this.matchSets,
      required this.date});

  factory MatchGame.fromJson(Map<String, dynamic> json, String id) {
    return MatchGame(
      id: id,
      winnerId: json['winnerId'],
      loserId: json['loserId'],
      matchSets: json['matchSets']
          .map<MatchSet>((matchSet) => MatchSet.fromJson(matchSet))
          .toList()
          .cast<MatchSet>(),
      date: DateTime.parse(json['date']),
    );
  }

  toJson() {
    return {
      'winnerId': winnerId,
      'loserId': loserId,
      'matchSets': matchSets.map((matchSet) => matchSet.toJson()).toList(),
      'date': date.toIso8601String(),
    };
  }
}
