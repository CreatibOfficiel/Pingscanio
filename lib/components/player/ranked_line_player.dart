import 'package:flutter/material.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class RankedLinePlayer extends StatelessWidget {
  Player player;

  RankedLinePlayer({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 56,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: ThemeColor.neutralColor_800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                Text(
                  '${player.rank}',
                  style: ThemeText.textBold.copyWith(
                    color: ThemeColor.neutralColor_500,
                  ),
                ),
                const SizedBox(width: 8),
                // round container with image
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(player.profilePictureUrl),
                  backgroundColor: ThemeColor.neutralColor_700,
                ),
                const SizedBox(width: 8),
                Text(
                  player.fullName,
                  style: ThemeText.textRegular.copyWith(
                    color: ThemeColor.neutralColor_300,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.show_chart,
                      color: ThemeColor.neutralColor_500,
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${player.elo}',
                      style: ThemeText.subText.copyWith(
                        color: ThemeColor.neutralColor_300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.percent_rounded,
                      color: ThemeColor.neutralColor_500,
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      player.winrate,
                      style: ThemeText.subText.copyWith(
                        color: ThemeColor.neutralColor_300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
