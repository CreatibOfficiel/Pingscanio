import 'package:flutter/material.dart';
import 'package:pingscanio/screens/modal/match_detail_modal.dart';
import 'package:pingscanio/database/services/player_service.dart';
import 'package:pingscanio/objects/match_game.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

import '../../objects/player.dart';

class MatchLineOverview extends StatefulWidget {
  MatchGame match;
  String date;

  MatchLineOverview({super.key, required this.match, required this.date});

  @override
  State<MatchLineOverview> createState() => _MatchLineOverviewState();
}

class _MatchLineOverviewState extends State<MatchLineOverview> {
  late Player winner;
  late Player loser;
  bool isLoaded = false;

  Future<void> getPlayersData() async {
    winner = await PlayerService().getPlayerById(widget.match.winnerId);
    loser = await PlayerService().getPlayerById(widget.match.loserId);

    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getPlayersData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.date != '') ...[
              const SizedBox(height: 16),
              Text(widget.date,
                style: ThemeText.textHeading.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
              const SizedBox(height: 16),
            ],
              InkWell(
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: ThemeColor.neutralColor_800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(winner.fullName,
                                style: ThemeText.textBold.copyWith(
                                  color: ThemeColor.neutralColor_100,
                                )),
                            Text(loser.fullName,
                                style: ThemeText.textRegular.copyWith(
                                  color: ThemeColor.neutralColor_400,
                                )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  widget.match.matchSets[0].winnerScore
                                      .toString(),
                                  style: ThemeText.textRegular.copyWith(
                                    color: widget.match.matchSets[0].winnerId ==
                                            winner.id
                                        ? ThemeColor.neutralColor_400
                                        : ThemeColor.neutralColor_600,
                                  )),
                              Text(
                                  widget.match.matchSets[0].loserScore
                                      .toString(),
                                  style: ThemeText.textRegular.copyWith(
                                    color: widget.match.matchSets[0].winnerId ==
                                            loser.id
                                        ? ThemeColor.neutralColor_400
                                        : ThemeColor.neutralColor_600,
                                  )),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  widget.match.matchSets[1].winnerScore
                                      .toString(),
                                  style: ThemeText.textRegular.copyWith(
                                    color: widget.match.matchSets[1].winnerId ==
                                            winner.id
                                        ? ThemeColor.neutralColor_400
                                        : ThemeColor.neutralColor_600,
                                  )),
                              Text(
                                  widget.match.matchSets[1].loserScore
                                      .toString(),
                                  style: ThemeText.textRegular.copyWith(
                                    color: widget.match.matchSets[1].winnerId ==
                                            loser.id
                                        ? ThemeColor.neutralColor_400
                                        : ThemeColor.neutralColor_600,
                                  )),
                            ],
                          ),
                          if (widget.match.matchSets.length == 3) ...[
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    widget.match.matchSets[2].winnerScore
                                        .toString(),
                                    style: ThemeText.textRegular.copyWith(
                                      color:
                                          widget.match.matchSets[2].winnerId ==
                                                  winner.id
                                              ? ThemeColor.neutralColor_400
                                              : ThemeColor.neutralColor_600,
                                    )),
                                Text(
                                    widget.match.matchSets[2].loserScore
                                        .toString(),
                                    style: ThemeText.textRegular.copyWith(
                                      color:
                                          widget.match.matchSets[2].winnerId ==
                                                  loser.id
                                              ? ThemeColor.neutralColor_400
                                              : ThemeColor.neutralColor_600,
                                    )),
                              ],
                            ),
                          ],
                          const SizedBox(width: 10),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: ThemeColor.neutralColor_700,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('2',
                                      style: ThemeText.textBold.copyWith(
                                        color: ThemeColor.neutralColor_50,
                                      )),
                                  Container(
                                    height: 1,
                                    width: 40,
                                    color: ThemeColor.neutralColor_700,
                                  ),
                                  Text(
                                      widget.match.matchSets.length == 3
                                          ? '1'
                                          : '0',
                                      style: ThemeText.textRegular.copyWith(
                                        color: ThemeColor.neutralColor_500,
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _matchDetailModal(context);
                },
              )
          ],
        ) : Container();
  }
  
  void _matchDetailModal(BuildContext context) {
    showModalBottomSheet(context: context, shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ), backgroundColor: ThemeColor.neutralColor_900, builder: (BuildContext bc) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: MatchDetailModal(match: widget.match),
      );
    });
  }
}
