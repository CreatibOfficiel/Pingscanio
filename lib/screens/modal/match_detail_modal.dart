import 'package:flutter/material.dart';
import 'package:pingscanio/components/match/match_line_overview.dart';
import 'package:pingscanio/components/match/match_result_line.dart';
import 'package:pingscanio/database/services/match_service.dart';
import 'package:pingscanio/database/services/player_service.dart';
import 'package:pingscanio/objects/match_game.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class MatchDetailModal extends StatefulWidget {
  final MatchGame match;

  const MatchDetailModal({super.key, required this.match});

  @override
  State<MatchDetailModal> createState() => _MatchDetailModalState();
}

class _MatchDetailModalState extends State<MatchDetailModal> {

  MatchGame get match => widget.match;

  late final Player winner;
  late final Player loser;
  bool isLoaded = false;

  late final List<MatchGame> matches;

  void initData() async {
    winner = await PlayerService().getPlayerById(match.winnerId);
    loser = await PlayerService().getPlayerById(match.loserId);
    matches = await MatchService().getMatchesOfTwoPlayers(winner.id!, loser.id!, match.id!);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded ? Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Feuille de match',
              style: ThemeText.textTitle.copyWith(
                  color: ThemeColor.neutralColor_100,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close, size: 24),
                color: ThemeColor.closeButton,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 48),
          MatchResultLine(
            winner: winner,
            loser: loser,
            nbOfSets: match.matchSets.length,
          ),
          const SizedBox(height: 48),
          MatchLineOverview(match: match),
          const SizedBox(height: 16),
          Text('Historique des 3 derniers matchs',
            style: ThemeText.textHeading.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
          ),
          const SizedBox(height: 16),
          if (matches.isNotEmpty)...[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return MatchLineOverview(match: matches[index]);
                },
              ),
            ),
          ] else ...[
            Text(
              'Aucun historique',
              style: ThemeText.textRegular.copyWith(
                color: ThemeColor.neutralColor_300,
              ),
            ),
          ],
        ],
      ),
    ) : const Center(
      child: CircularProgressIndicator(
        color: ThemeColor.primaryColor,
      ),
    );
  }
}