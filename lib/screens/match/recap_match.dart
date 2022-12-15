import 'package:flutter/material.dart';
import 'package:pingscanio/components/match/match_result_line.dart';
import 'package:pingscanio/components/match/match_sets_detail.dart';
import 'package:pingscanio/components/player/elo_update_line_player.dart';
import 'package:pingscanio/objects/match_set.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class RecapMatch extends StatefulWidget {
  final List<MatchSet> sets;
  final Player firstPlayer;
  final Player secondPlayer;

  const RecapMatch(
      {super.key,
      required this.sets,
      required this.firstPlayer,
      required this.secondPlayer});

  @override
  State<RecapMatch> createState() => _RecapMatchState();
}

class _RecapMatchState extends State<RecapMatch> {
  bool isLoaded = false;
  late Player _winner;
  late Player _loser;

  // find the winner and loser of the match with the sets
  void _initPlayers() {
    int firstPlayerScore = 0;
    int secondPlayerScore = 0;
    for (MatchSet matchSet in widget.sets) {
      if (matchSet.winner == widget.firstPlayer) {
        firstPlayerScore++;
      } else {
        secondPlayerScore++;
      }
    }
    if (firstPlayerScore > secondPlayerScore) {
      _winner = widget.firstPlayer;
      _loser = widget.secondPlayer;
    } else {
      _winner = widget.secondPlayer;
      _loser = widget.firstPlayer;
    }

    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded
          ? Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ajouter un match",
                      style: ThemeText.textTitle.copyWith(
                        color: ThemeColor.neutralColor_100,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "On est tout bon ?",
                      style: ThemeText.textRegular.copyWith(
                        color: ThemeColor.neutralColor_300,
                      ),
                    ),
                    const SizedBox(height: 48),
                    MatchResultLine(
                        winner: _winner,
                        loser: _loser,
                        nbOfSets: widget.sets.length),
                    const SizedBox(height: 48),
                    MatchSetsDetail(
                        sets: widget.sets, winner: _winner, loser: _loser),
                    const SizedBox(height: 16),
                    EloUpdateLinePlayer(winner: _winner, loser: _loser),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: ThemeColor.primaryColor,
              ),
            ),
    );
  }
}
