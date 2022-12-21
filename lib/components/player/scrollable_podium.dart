import 'package:flutter/material.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class ScrollablePodium extends StatelessWidget {
  List<Player> bestPlayers;

  ScrollablePodium({super.key, required this.bestPlayers});

  Color _getBackgroundColor(int index) {
    switch (index) {
      case 0:
        return ThemeColor.goldColor;
      case 1:
        return ThemeColor.silverColor;
      case 2:
        return ThemeColor.bronzeColor;
      default:
        return ThemeColor.neutralColor_100;
    }
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.looks_one_outlined;
      case 1:
        return Icons.looks_two_outlined;
      case 2:
        return Icons.looks_3_outlined;
      default:
        return Icons.star_border;
    }
  }

  Color _getIconColor(int index) {
    switch (index) {
      case 0:
        return ThemeColor.neutralColor_100;
      default:
        return ThemeColor.neutralColor_800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 208,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bestPlayers.length,
          itemBuilder: (context, index) {
            return SizedBox(
                width: 140,
                height: 200,
                child: Stack(
                  children: [
                    InkWell(
                      child: Card(
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  bestPlayers[index].profilePictureUrl,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 140,
                                ),
                              ),
                              Positioned.fill(
                                top: 118,
                                child: Text(
                                  bestPlayers[index].firstName,
                                  textAlign: TextAlign.center,
                                  style: ThemeText.textHeading.copyWith(
                                    color: ThemeColor.neutralColor_100,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                  top: 151,
                                  left: 25,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.show_chart,
                                            color: ThemeColor.neutralColor_500,
                                            size: 12,
                                          ),
                                          const SizedBox(width: 5),
                                          Text("ÉLO",
                                              style: ThemeText.textCaption
                                                  .copyWith(
                                                color:
                                                    ThemeColor.neutralColor_500,
                                              )),
                                        ],
                                      ),
                                      Text(
                                        bestPlayers[index].elo.toString(),
                                        style: ThemeText.textBold.copyWith(
                                          color: ThemeColor.neutralColor_100,
                                        ),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                  top: 151,
                                  right: 25,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.percent_rounded,
                                            color: ThemeColor.neutralColor_500,
                                            size: 12,
                                          ),
                                          const SizedBox(width: 5),
                                          Text("WIN",
                                              style: ThemeText.textCaption
                                                  .copyWith(
                                                color:
                                                    ThemeColor.neutralColor_500,
                                              )),
                                        ],
                                      ),
                                      Text(
                                        bestPlayers[index].winrate,
                                        style: ThemeText.textBold.copyWith(
                                          color: ThemeColor.neutralColor_100,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                      onTap: () => {print("tapped")},
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: _getBackgroundColor(index),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _getIcon(index),
                          color: _getIconColor(index),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
