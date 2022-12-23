import 'package:flutter/material.dart';
import 'package:pingscanio/components/button/round_back_button.dart';
import 'package:pingscanio/components/button/round_button.dart';
import 'package:pingscanio/components/player/checkable_line_player.dart';
import 'package:pingscanio/database/services/player_service.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/screens/match/set_score.dart';
import 'package:pingscanio/screens/player/add_player.dart';
import 'package:pingscanio/theme/text_styles.dart';

import '../../theme/colors.dart';

class SelectPlayer extends StatefulWidget {
  const SelectPlayer({super.key});

  @override
  State<SelectPlayer> createState() => _SelectPlayerState();
}

class _SelectPlayerState extends State<SelectPlayer> {
  int _numberOfPlayerSelected = 0;
  List<Player> _players = [];

  Player? firstPlayer;
  Player? secondPlayer;

  bool isLoaded = false;

  void selectPlayer(Player player) {
    if (firstPlayer == null) {
      firstPlayer = player;
      incrementNumberOfPlayerSelected();
      return;
    }

    if (secondPlayer == null && player != firstPlayer) {
      secondPlayer = player;
      incrementNumberOfPlayerSelected();
      return;
    }

    if (player == firstPlayer) {
      firstPlayer = secondPlayer;
      secondPlayer = null;
      decrementNumberOfPlayerSelected();
      return;
    }

    if (player == secondPlayer) {
      secondPlayer = null;
      decrementNumberOfPlayerSelected();
      return;
    }

    firstPlayer = secondPlayer;
    secondPlayer = player;

    setState(() {
      _numberOfPlayerSelected;
    });
  }

  void decrementNumberOfPlayerSelected() {
    setState(() {
      if (_numberOfPlayerSelected > 0) _numberOfPlayerSelected--;
    });
  }

  void incrementNumberOfPlayerSelected() {
    setState(() {
      if (_numberOfPlayerSelected < 2) _numberOfPlayerSelected++;
    });
  }

  void nextScreen() {
    if (_numberOfPlayerSelected == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SetScore(
                  firstPlayer: firstPlayer!,
                  secondPlayer: secondPlayer!,
                )),
      );
    }
  }

  void onTextChanged(String text) {
    if (text.isEmpty) {
      _getPlayers();
    } else {
      _searchPlayer(text);
    }
  }

  void _getPlayers() async {
    _players = await PlayerService().getPlayers();
    setState(() {
      isLoaded = true;
    });
  }

  void _searchPlayer(String text) async {
    setState(() {
      _players = _players
          .where((player) =>
              player.firstName.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 60),
          child: isLoaded
              ? SingleChildScrollView(
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
                      "Qui veut se la coller ?",
                      style: ThemeText.textRegular.copyWith(
                        color: ThemeColor.neutralColor_300,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Recherche",
                      style: ThemeText.textHeading.copyWith(
                        color: ThemeColor.neutralColor_300,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 56,
                      child: TextField(
                        onChanged: onTextChanged,
                        cursorColor: ThemeColor.neutralColor_300,
                        style: ThemeText.textRegular.copyWith(
                          color: ThemeColor.neutralColor_300,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ThemeColor.neutralColor_800,
                          contentPadding: const EdgeInsets.only(
                              left: 16, top: 20, bottom: 20),
                          hintText: "Entre le prénom de quelqu'un",
                          hintStyle: ThemeText.textRegular.copyWith(
                            color: ThemeColor.neutralColor_500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: ThemeColor.neutralColor_750,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: ThemeColor.neutralColor_750,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: ThemeColor.neutralColor_750,
                            ),
                          ),
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: const Icon(
                              Icons.search,
                              color: ThemeColor.neutralColor_500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Tous les joueurs·euses",
                      style: ThemeText.textHeading.copyWith(
                        color: ThemeColor.neutralColor_300,
                      ),
                    ),
                    Column(
                      children: [
                        ListView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _players.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: ThemeColor.neutralColor_800,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: ThemeColor.neutralColor_500,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddPlayer(
                                                refreshPlayers: _getPlayers),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    "Ajouter un·e joueur·euse",
                                    style: ThemeText.textRegular.copyWith(
                                      color: ThemeColor.neutralColor_300,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  const SizedBox(height: 8),
                                  CheckableLinePlayer(
                                      player: _players[index - 1],
                                      selectPlayer: selectPlayer,
                                      isSelected: _players[index - 1].id ==
                                              firstPlayer?.id ||
                                          _players[index - 1].id == secondPlayer?.id),
                                  if (index == _players.length)
                                    const SizedBox(height: 16),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ))
              : const Center(
                  child: CircularProgressIndicator(
                    color: ThemeColor.primaryColor,
                  ),
                )),
      bottomNavigationBar: BottomAppBar(
          color: ThemeColor.primaryColor,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 96,
            child: Row(children: [
              const Expanded(
                child: RoundBackButton(
                  text: "Annuler",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _numberOfPlayerSelected == 2
                    ? RoundButton(
                        text: "Continuer",
                        enabled: _numberOfPlayerSelected == 2,
                        onPressed: nextScreen,
                      )
                    : RoundButton(
                        text: "$_numberOfPlayerSelected/2",
                        enabled: _numberOfPlayerSelected == 2,
                        onPressed: () {}),
              ),
            ]),
          )),
    );
  }
}
