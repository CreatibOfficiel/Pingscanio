Elo Update Line Player

import 'package:flutter/material.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class EloUpdateLinePlayer extends StatelessWidget {
  Player winner;
  Player loser;

  EloUpdateLinePlayer({super.key, required this.winner, required this.loser});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Élo",
            style: ThemeText.textHeading.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 64,
            decoration: BoxDecoration(
              color: ThemeColor.neutralColor_800,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(winner.profilePictureUrl),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${winner.firstName} ${winner.lastName.substring(0, 2)}.',
                          style: ThemeText.textRegular.copyWith(
                            color: ThemeColor.neutralColor_100,
                          )),
                      const SizedBox(height: 4),
                      Text('1983 -> 1995',
                          style: ThemeText.subText.copyWith(
                            color: ThemeColor.neutralColor_300,
                          )
                        ),
                      ],
                    ),
                  ],
                ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_upward_outlined,
                    color: ThemeColor.successColor_500, size: 16),
                const SizedBox(width: 8),
                Text('+12',
                    style: ThemeText.textBold.copyWith(
                      color: ThemeColor.successColor_500,
                    )),
                    const SizedBox(width: 16),
                  ],
                )
            ],
          )
        ),
        const SizedBox(height: 16),
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: ThemeColor.neutralColor_800,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(loser.profilePictureUrl),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${loser.firstName} ${loser.lastName.substring(0, 2)}.',
                          style: ThemeText.textRegular.copyWith(
                            color: ThemeColor.neutralColor_100,
                          )),
                      const SizedBox(height: 4),
                      Text('1983 -> 1995',
                          style: ThemeText.subText.copyWith(
                            color: ThemeColor.neutralColor_300,
                          )),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_downward_outlined,
                      color: ThemeColor.errorColor_500, size: 16),
                  const SizedBox(width: 8),
                  Text('-12',
                      style: ThemeText.textBold.copyWith(
                        color: ThemeColor.errorColor_500,
                      )),
                  const SizedBox(width: 16),
                ],
              )
            ],
          ))
      ]
    );
  }
}

