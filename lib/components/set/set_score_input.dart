import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pingscanio/objects/match_set.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

import '../../objects/player.dart';

class SetScoreInput extends StatefulWidget {
  final Player firstPlayer;
  final Player secondPlayer;

  final Function(MatchSet matchSet, int setNumber) addSet;

  final int setNumber;

  const SetScoreInput(
      {super.key,
      required this.firstPlayer,
      required this.secondPlayer,
      required this.setNumber,
      required this.addSet});

  @override
  State<SetScoreInput> createState() => _SetScoreInputState();
}

class _SetScoreInputState extends State<SetScoreInput> {
  final TextEditingController _setScoreOfFirstPlayer = TextEditingController(text: '0');
  final TextEditingController _setScoreOfSecondPlayer = TextEditingController(text: '0');

  void _onTextChanged(String text) {
    // check if both text fields are filled
    if (_setScoreOfFirstPlayer.text.isNotEmpty &&
        _setScoreOfSecondPlayer.text.isNotEmpty) {
      int scoreOfFirstPlayer = int.parse(_setScoreOfFirstPlayer.text);
      int scoreOfSecondPlayer = int.parse(_setScoreOfSecondPlayer.text);

      // check if one of the two scores is >= 11
      if (scoreOfFirstPlayer >= 11 || scoreOfSecondPlayer >= 11) {
        // check if the two scores are > 10
        if (scoreOfFirstPlayer > 10 && scoreOfSecondPlayer > 10) {
          // check if the difference between the two scores is != 2, if so, return
          if ((scoreOfFirstPlayer - scoreOfSecondPlayer).abs() != 2) {
            // show scaffold message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "La différence entre les scores doit être de 2.",
                  style: ThemeText.textRegular.copyWith(
                    color: ThemeColor.neutralColor_100,
                  ),
                ),
                backgroundColor: ThemeColor.neutralColor_800,
              ),
            );
            return;
          }
        }

        createSet(scoreOfFirstPlayer > scoreOfSecondPlayer
            ? widget.firstPlayer
            : widget.secondPlayer);
      }
    }
  }

  // create MatchSet object
  // add MatchSet object to match
  void createSet(Player winner) {
    MatchSet matchSet = MatchSet(
      setNumber: widget.setNumber,
      winnerScore: int.parse(_setScoreOfFirstPlayer.text),
      loserScore: int.parse(_setScoreOfSecondPlayer.text),
      winnerId: winner.id!,
    );

    widget.addSet(matchSet, widget.setNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Set ${widget.setNumber}",
          style: ThemeText.textHeading.copyWith(
            color: ThemeColor.neutralColor_300,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(widget.firstPlayer.profilePictureUrl),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.firstPlayer.fullName,
                  style: ThemeText.textRegular.copyWith(
                    color: ThemeColor.neutralColor_300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56,
              width: 64,
              child: TextFormField(
                onChanged: _onTextChanged,
                controller: _setScoreOfFirstPlayer,
                enableInteractiveSelection: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                keyboardType: TextInputType.number,
                showCursor: false,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                style: ThemeText.scoreText.copyWith(
                  color: ThemeColor.neutralColor_500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeColor.neutralColor_800,
                  hintText: "0",
                  hintStyle: ThemeText.scoreText.copyWith(
                    color: ThemeColor.neutralColor_500,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: ThemeColor.neutralColor_750,
                      width: 1,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: ThemeColor.neutralColor_750,
                      width: 1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: ThemeColor.neutralColor_750,
                      width: 1,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(widget.secondPlayer.profilePictureUrl),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.secondPlayer.fullName,
                  style: ThemeText.textRegular.copyWith(
                    color: ThemeColor.neutralColor_300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56,
              width: 64,
              child: TextFormField(
                onChanged: _onTextChanged,
                controller: _setScoreOfSecondPlayer,
                enableInteractiveSelection: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                keyboardType: TextInputType.number,
                showCursor: false,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                style: ThemeText.scoreText.copyWith(
                  color: ThemeColor.neutralColor_500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ThemeColor.neutralColor_800,
                  hintText: "0",
                  hintStyle: ThemeText.scoreText.copyWith(
                    color: ThemeColor.neutralColor_500,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: ThemeColor.neutralColor_750,
                      width: 1,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: ThemeColor.neutralColor_750,
                      width: 1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: ThemeColor.neutralColor_750,
                      width: 1,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
