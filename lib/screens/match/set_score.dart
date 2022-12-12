import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pingscanio/components/button/round_back_button.dart';
import 'package:pingscanio/components/button/round_button.dart';
import 'package:pingscanio/components/set/set_score_input.dart';
import 'package:pingscanio/objects/match_set.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/screens/match/recap_match.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class SetScore extends StatefulWidget {
  final Player firstPlayer;
  final Player secondPlayer;

  const SetScore(
      {super.key, required this.firstPlayer, required this.secondPlayer});

  @override
  State<SetScore> createState() => _SetScoreState();
}

class _SetScoreState extends State<SetScore> {
  List<MatchSet> _sets = [];
  bool _isAllValid = false;

  void _addSet(MatchSet matchSet, int setNumber) {
    if (setNumber == 3 && _areSetsComplete()) {
      // victory in 2 sets, the third set is not needed
      HapticFeedback.mediumImpact();
      return;
    }
    _sets.insert(setNumber - 1, matchSet);

    setState(() {
      _isAllValid = _areSetsComplete();
    });
  }

  bool _areSetsComplete() {
    if (_sets.length < 2) {
      // not enough sets
      return false;
    }

    if (_sets.length == 3 && _sets[0].winner != _sets[1].winner) {
      // victory in 3 sets
      return true;
    } else if (_sets.length == 3 && _sets[0].winner == _sets[1].winner) {
      // victory in 2 sets, too much sets
      _sets.removeLast();
      return true;
    }
    return false;
  }

  void nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecapMatch(
                sets: _sets,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                "Match serré ou grosse raclée ?",
                style: ThemeText.textRegular.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
              const SizedBox(height: 32),
              SetScoreInput(
                  firstPlayer: widget.firstPlayer,
                  secondPlayer: widget.secondPlayer,
                  setNumber: 1,
                  addSet: _addSet),
              const SizedBox(height: 24),
              SetScoreInput(
                  firstPlayer: widget.firstPlayer,
                  secondPlayer: widget.secondPlayer,
                  setNumber: 2,
                  addSet: _addSet),
              const SizedBox(height: 24),
              SetScoreInput(
                  firstPlayer: widget.firstPlayer,
                  secondPlayer: widget.secondPlayer,
                  setNumber: 3,
                  addSet: _addSet),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: ThemeColor.primaryColor,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 96,
            child: Row(children: [
              const Expanded(
                child: RoundBackButton(
                  text: "Précédent",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RoundButton(
                    text: "Continuer",
                    enabled: _isAllValid,
                    onPressed: nextScreen),
              ),
            ]),
          )),
    );
  }
}
