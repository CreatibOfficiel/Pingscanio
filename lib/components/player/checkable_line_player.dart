Checkable Line Player

import 'package:flutter/material.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class CheckableLinePlayer extends StatelessWidget {
  final Player player;
  final Function(Player player) selectPlayer;
  final bool isSelected;

  const CheckableLinePlayer(
      {super.key,
      required this.player,
      required this.selectPlayer(Player player),
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectPlayer(player);
      },
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: isSelected
              ? ThemeColor.primaryColor_900
              : ThemeColor.neutralColor_800,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected ? ThemeColor.primaryColor_500 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelected
                      ? ThemeColor.primaryColor_500
                      : ThemeColor.neutralColor_700,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isSelected
                        ? ThemeColor.primaryColor_500
                        : ThemeColor.neutralColor_500,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: isSelected
                      ? ThemeColor.neutralColor_900
                      : Colors.transparent,
                  size: 16,
                )),
            const SizedBox(width: 24),
            // round container with image
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(player.profilePictureUrl),
            ),
            const SizedBox(width: 8),
            Text(
              '${player.firstName} ${player.lastName.substring(0, 2)}.',
              style: ThemeText.textRegular.copyWith(
                color: ThemeColor.neutralColor_300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
