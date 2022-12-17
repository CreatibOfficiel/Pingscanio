import 'package:flutter/material.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class MatchResultLine extends StatelessWidget {
  final Player winner;
  final Player loser;
  final int nbOfSets;

  const MatchResultLine(
      {super.key,
      required this.winner,
      required this.loser,
      required this.nbOfSets});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(loser.profilePictureUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              loser.fullName,
              style: ThemeText.textBold.copyWith(
                color: ThemeColor.neutralColor_100,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              loser.rank == 0 ? 'N/A' : '#${loser.rank}',
              style: ThemeText.textRegular.copyWith(
                color: ThemeColor.neutralColor_300,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              nbOfSets == 2 ? '0-2' : '1-2',
              style: ThemeText.scoreTextBold.copyWith(
                color: ThemeColor.neutralColor_100,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(winner.profilePictureUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              winner.fullName,
              style: ThemeText.textBold.copyWith(
                color: ThemeColor.neutralColor_100,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              winner.rank == 0 ? 'N/A' : '#${winner.rank}',
              style: ThemeText.textRegular.copyWith(
                color: ThemeColor.neutralColor_300,
              ),
            ),
          ],
        )
      ],
    );
  }
}
