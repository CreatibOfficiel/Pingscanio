import 'package:flutter/material.dart';
import 'package:pingscanio/objects/match_set.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class RecapMatch extends StatefulWidget {
  final List<MatchSet> sets;

  const RecapMatch({super.key, required this.sets});

  @override
  State<RecapMatch> createState() => _RecapMatchState();
}

class _RecapMatchState extends State<RecapMatch> {
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
                "On est tout bon ?",
                style: ThemeText.textRegular.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                "Résultat, nb de set : ${widget.sets.length}",
                style: ThemeText.textRegular.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
