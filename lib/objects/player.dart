class Player {
  String? id;
  String firstName;
  String lastName;
  String profilePictureUrl;

  int? rank;
  int? elo;
  int? winrate;

  Player(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.profilePictureUrl,
      this.rank,
      this.elo,
      this.winrate});

  factory Player.fromJson(Map<String, dynamic> json, String id) {
    return Player(
      id: id,
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePictureUrl: json['profilePictureUrl'],
      rank: json['rank'],
      elo: json['elo'],
      winrate: json['winrate'],
    );
  }

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'profilePictureUrl': profilePictureUrl,
      'rank': rank ?? 0,
      'elo': elo ?? 0,
      'winrate': winrate ?? 0,
    };
  }
}
