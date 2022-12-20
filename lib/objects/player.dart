class Player {
  String? id;
  String firstName;
  String lastName;
  String profilePictureUrl;

  int? rank;
  int? elo;
  int? gameCount;
  int? gameWonCount;

  Player(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.profilePictureUrl,
      this.rank,
      this.elo,
      this.gameCount,
      this.gameWonCount});

  factory Player.fromJson(Map<String, dynamic> json, String id) {
    return Player(
      id: id,
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePictureUrl: json['profilePictureUrl'],
      rank: json['rank'],
      elo: json['elo'],
      gameCount: json['gameCount'],
      gameWonCount: json['gameWonCount'],
    );
  }

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'profilePictureUrl': profilePictureUrl,
      'rank': rank ?? 0,
      'elo': elo ?? 1000,
      'gameCount': gameCount ?? 0,
      'gameWonCount': gameWonCount ?? 0,
    };
  }

  String get fullName {
    if (lastName.length <= 2) {
      return '$firstName $lastName';
    }
    return '$firstName ${lastName.substring(0, 2)}.';
  }


  // calcul the winrate of the player in percent and return it in a string
  String get winrate {
    if (gameCount == 0) {
      return '0';
    } else {
      return ((gameWonCount! / gameCount!) * 100).toStringAsFixed(0);
    }
  }
}
