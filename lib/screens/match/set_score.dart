import 'package:flutter/material.dart';
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
  final List<MatchSet> _sets = [];
  bool _isAllValid = false;
  bool _matchInThreeSets = false;

  void _addSet(MatchSet matchSet, int setNumber) {
    // replace set if already exists
    if (_sets.length == setNumber - 1) {
      _sets.add(matchSet);
    } else {
      _sets[setNumber - 1] = matchSet;
    }

    setState(() {
      _isAllValid = _areSetsComplete();
    });
    return;
  }

  bool _areSetsComplete() {
    if (_sets.length < 2) {
      // not enough sets
      return false;
    }

    if (_sets.length == 3 && _sets[0].winnerId != _sets[1].winnerId) {
      // victory in 3 sets
      return true;
    } else if (_sets.length == 2 && _sets[0].winnerId == _sets[1].winnerId) {
      // victory in 2 sets
      return true;
    } else if (_sets.length == 3 && _sets[0].winnerId == _sets[1].winnerId) {
      // victory in 2 sets, too many sets so remove last one
      _sets.removeLast();
      _matchInThreeSets = false;
      return true;
    } else if (_sets.length == 2 && _sets[0].winnerId != _sets[1].winnerId) {
      // victory in 3 sets, not enough sets
      _matchInThreeSets = true;
      return false;
    }
    return false;
  }

  void nextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecapMatch(
                sets: _sets,
                firstPlayer: widget.firstPlayer,
                secondPlayer: widget.secondPlayer,
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
              if (_sets.isNotEmpty) ...[
                const SizedBox(height: 24),
                SetScoreInput(
                    firstPlayer: widget.firstPlayer,
                    secondPlayer: widget.secondPlayer,
                    setNumber: 2,
                    addSet: _addSet),
              ],
              if (_sets.length >= 2 && _matchInThreeSets) ...[
                const SizedBox(height: 24),
                SetScoreInput(
                    firstPlayer: widget.firstPlayer,
                    secondPlayer: widget.secondPlayer,
                    setNumber: 3,
                    addSet: _addSet),
              ],
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
