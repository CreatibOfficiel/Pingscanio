import 'dart:math';

class EloService {
  int calculateElo(int opponentElo, int playerElo, bool playerWon,
      {int kFactor = 32}) {
    // Calculate the new elo for the player
    num newElo = (playerElo +
        kFactor *
            ((playerWon ? 1 : 0) -
                (1 / (1 + pow(10, (opponentElo - playerElo) / 400)))));

    // Return the new elo
    return newElo.toInt();
  }

  int calculateEloWithScore(
      int opponentElo, int playerElo, int playerScore, int opponentScore,
      {int kFactor = 32}) {
    // Calculate the expected score for the player
    double expectedScore = 1 / (1 + pow(10, (opponentElo - playerElo) / 400));

    // Calculate the new elo for the player
    num newElo = playerElo +
        kFactor *
            ((playerScore / (playerScore + opponentScore)) - expectedScore);

    // Return the new elo
    return newElo.toInt();
  }
}
