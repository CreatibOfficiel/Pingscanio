MatchSetsDetail

import 'package:flutter/material.dart';
import 'package:pingscanio/objects/match_set.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/text_styles.dart';

import '../../theme/colors.dart';

class MatchSetsDetail extends StatelessWidget {
  final List<MatchSet> sets;
  final Player winner;
  final Player loser;

  const MatchSetsDetail(
      {super.key,
      required this.sets,
      required this.winner,
      required this.loser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ThemeColor.neutralColor_700,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sets',
                    style: ThemeText.textHeading.copyWith(
                      color: ThemeColor.neutralColor_300,
                    )),
                const SizedBox(height: 32),
                Text('${winner.firstName} ${winner.lastName.substring(0, 2)}.',
                    style: ThemeText.textRegular.copyWith(
                      color: ThemeColor.neutralColor_100,
                    )),
                const SizedBox(height: 16),
                Text('${loser.firstName} ${loser.lastName.substring(0, 2)}.',
                    style: ThemeText.textRegular.copyWith(
                      color: ThemeColor.neutralColor_100,
                    )),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('1',
                        style: ThemeText.subText.copyWith(
                          color: ThemeColor.neutralColor_50,
                        )),
                    const SizedBox(height: 32),
                    Text(sets[0].winnerScore.toString(),
                        style: ThemeText.textRegular.copyWith(
                          color: sets[0].winner == winner
                              ? ThemeColor.neutralColor_400
                              : ThemeColor.neutralColor_600,
                        )),
                    const SizedBox(height: 16),
                    Text(sets[0].loserScore.toString(),
                        style: ThemeText.textRegular.copyWith(
                          color: sets[0].winner == loser
                              ? ThemeColor.neutralColor_400
                              : ThemeColor.neutralColor_600,
                        )),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('2',
                        style: ThemeText.subText.copyWith(
                          color: ThemeColor.neutralColor_50,
                        )),
                    const SizedBox(height: 32),
                    Text(sets[1].winnerScore.toString(),
                        style: ThemeText.textRegular.copyWith(
                          color: sets[1].winner == winner
                              ? ThemeColor.neutralColor_400
                              : ThemeColor.neutralColor_600,
                        )),
                    const SizedBox(height: 16),
                    Text(sets[1].loserScore.toString(),
                        style: ThemeText.textRegular.copyWith(
                          color: sets[1].winner == loser
                              ? ThemeColor.neutralColor_400
                              : ThemeColor.neutralColor_600,
                        )),
                  ],
                ),
                if (sets.length == 3) ...[
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('3',
                          style: ThemeText.subText.copyWith(
                            color: ThemeColor.neutralColor_50,
                          )),
                      const SizedBox(height: 32),
                      Text(sets[2].winnerScore.toString(),
                          style: ThemeText.textRegular.copyWith(
                            color: sets[2].winner == winner
                                ? ThemeColor.neutralColor_400
                                : ThemeColor.neutralColor_600,
                          )),
                      const SizedBox(height: 16),
                      Text(sets[2].loserScore.toString(),
                          style: ThemeText.textRegular.copyWith(
                            color: sets[2].winner == loser
                                ? ThemeColor.neutralColor_400
                                : ThemeColor.neutralColor_600,
                          )),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
        const Divider(
          color: ThemeColor.neutralColor_700,
        ),
      ],
    );
  }
}
