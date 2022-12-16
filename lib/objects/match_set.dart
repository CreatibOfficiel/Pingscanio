class MatchSet {
  final int setNumber;
  final int winnerScore;
  final int loserScore;
  final String winnerId;

  MatchSet({
    required this.setNumber,
    required this.winnerScore,
    required this.loserScore,
    required this.winnerId,
  });

  factory MatchSet.fromJson(Map<String, dynamic> json) {
    return MatchSet(
      setNumber: json['setNumber'],
      winnerScore: json['winnerScore'],
      loserScore: json['loserScore'],
      winnerId: json['winnerId'],
    );
  }

  toJson() {
    return {
      'setNumber': setNumber,
      'winnerScore': winnerScore,
      'loserScore': loserScore,
      'winnerId': winnerId,
    };
  }
}
