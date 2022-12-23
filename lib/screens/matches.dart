import 'package:flutter/material.dart';
import 'package:pingscanio/components/match/match_line_overview.dart';
import 'package:pingscanio/database/services/match_service.dart';
import 'package:pingscanio/objects/match_game.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  List<MatchGame> matches = [];
  bool isLoaded = false;
  String lastMatchDate = '';

  String getLastMatchDate(int index) {
    String matchDate = dateToString(matches[index].date);
    if (matchDate != lastMatchDate) {
      lastMatchDate = matchDate;
      return matchDate;
    } else {
      return '';
    }
  }

  String dateToString(DateTime date) {
    if (date.day == DateTime.now().day && date.month == DateTime.now().month && date.year == DateTime.now().year) {
      return 'Aujourd\'hui';
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  getMatches() async {
    matches = await MatchService().getRecentMatches();

    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded
          ? Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 60),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Matchs",
                      style: ThemeText.textTitle.copyWith(
                        color: ThemeColor.neutralColor_100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (matches.isNotEmpty) ...[
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: matches.length,
                            itemBuilder: (context, index) {
                              return MatchLineOverview(match: matches[index], date: getLastMatchDate(index));
                            }),
                      ),
                      const SizedBox(height: 8),
                    ] else
                      Center(
                        child: Text(
                          "Aucun match enregistré",
                          style: ThemeText.textRegular.copyWith(
                            color: ThemeColor.neutralColor_100,
                          ),
                        ),
                      ),
                  ],
                ),
              ))
          : const Center(
              child: CircularProgressIndicator(
                color: ThemeColor.primaryColor,
              ),
            ),
    );
  }
}
