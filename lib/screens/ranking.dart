import 'package:flutter/material.dart';
import 'package:pingscanio/components/player/ranked_line_player.dart';
import 'package:pingscanio/components/player/scrollable_podium.dart';
import 'package:pingscanio/database/services/player_service.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  List<Player> players = [];
  List<Player> bestPlayers = [];
  bool isLoaded = false;

  void getPlayers() async {
    players = await PlayerService().getRankedPlayers();

    if (players.isEmpty) {
      setState(() {
        isLoaded = true;
      });
      return;
    }

    for (Player player in players) {
      if (bestPlayers.length < 3) {
        bestPlayers.add(player);
      } else {
        break;
      }
    }

    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded
          ? Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 60),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Classement",
                      style: ThemeText.textTitle.copyWith(
                        color: ThemeColor.neutralColor_100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (bestPlayers.isNotEmpty) ...[
                      ScrollablePodium(bestPlayers: bestPlayers),
                    ] else ...[
                      Center(
                        child: Text(
                          "Aucun joueur n'a encore joué",
                          style: ThemeText.textRegular.copyWith(
                            color: ThemeColor.neutralColor_100,
                          ),
                        ),
                      ),
                    ],
                    if (players.length > 3) ...[
                      const SizedBox(height: 16),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: players.length - 3,
                            itemBuilder: (context, index) {
                              return RankedLinePlayer(
                                player: players[index + 3],
                              );
                            }),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ],
                ),
              ))
          : const Center(
              child: CircularProgressIndicator(
                color: ThemeColor.primaryColor,
              ),
            ),
    );
  }
}
