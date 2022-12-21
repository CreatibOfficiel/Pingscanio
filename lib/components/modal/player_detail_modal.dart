

import 'package:flutter/material.dart';
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

  void initData() async {
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
      margin: const EdgeInsets.all( 16),
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
                icon: const Icon(Icons.close),
                color: ThemeColor.closeButton,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    ) : const Center(
      child: CircularProgressIndicator(
        color: ThemeColor.primaryColor,
      ),
    );
  }
}