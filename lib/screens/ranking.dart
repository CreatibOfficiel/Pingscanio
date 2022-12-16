import 'package:flutter/material.dart';
import 'package:pingscanio/components/player/scrollable_podium.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
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
                  "Classement",
                  style: ThemeText.textTitle.copyWith(
                    color: ThemeColor.neutralColor_100,
                  ),
                ),
                const SizedBox(height: 16),
                const ScrollablePodium(),
                const SizedBox(height: 16),
              ],
            ),
          )),
    );
  }
}
