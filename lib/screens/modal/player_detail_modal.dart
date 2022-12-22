

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pingscanio/components/match/match_line_overview.dart';
import 'package:pingscanio/database/services/match_service.dart';
import 'package:pingscanio/objects/match_game.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

import '../../objects/player.dart';

class PlayerDetailModal extends StatefulWidget {
  Player player;

  PlayerDetailModal({super.key, required this.player});

  @override
  State<PlayerDetailModal> createState() => _PlayerDetailModalState();
}

class _PlayerDetailModalState extends State<PlayerDetailModal> {

  Player get player => widget.player;
  bool isLoaded = false;

  late final List<MatchGame> matches;
  late final String lastMatchDate;

  void initData() async {
    matches = await MatchService().getMatchesOfPlayer(player.id!);

    lastMatchDate = DateFormat('dd/MM/yyyy').format(matches[0].date);

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
              Text('Fiche joueur',
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
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: NetworkImage(player.profilePictureUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player.fullName,
                        style: ThemeText.textHeading.copyWith(
                          color: ThemeColor.neutralColor_50,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Dernier match joué le :\n${player.gameCount == 0 ? 'N/A' : lastMatchDate}',
                        style: ThemeText.textRegular.copyWith(
                          color: ThemeColor.neutralColor_300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (player.rank! > 0) ... [
                if (player.rank! <= 3) ...[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(player.rank! - 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIcon(player.rank! - 1),
                      color: _getIconColor(player.rank! - 1),
                      size: 16,
                    ),
                  ),
                ] else ...[
                  Text(
                    '#${player.rank!}',
                    style: ThemeText.textHeading.copyWith(
                      color: ThemeColor.neutralColor_50,
                    ),
                  ),
                ],
              ]
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: ThemeColor.neutralColor_800,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: ThemeColor.primaryColor_900,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.show_chart,
                              color: ThemeColor.primaryColor_500,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Élo',
                            style: ThemeText.textRegular.copyWith(
                              color: ThemeColor.neutralColor_300,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${player.elo}',
                        style: ThemeText.statisticText.copyWith(
                          color: ThemeColor.neutralColor_50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: ThemeColor.neutralColor_800,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: ThemeColor.primaryColor_900,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.percent_rounded,
                              color: ThemeColor.primaryColor_500,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Winrate',
                            style: ThemeText.textRegular.copyWith(
                              color: ThemeColor.neutralColor_300,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        player.winrate,
                        style: ThemeText.statisticText.copyWith(
                          color: ThemeColor.neutralColor_50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Derniers matchs',
            style: ThemeText.textHeading.copyWith(
              color: ThemeColor.neutralColor_50,
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
              'Aucun match joué',
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
}